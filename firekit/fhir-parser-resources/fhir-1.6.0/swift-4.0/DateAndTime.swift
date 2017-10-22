//
//  DateAndTime.swift
//  SwiftFHIR
//
//  Created by Pascal Pfiffner on 1/17/15.
//  2015, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation
import RealmSwift

/**
A protocol for all our date and time structs.
*/
protocol DateAndTime: CustomStringConvertible, Comparable {
    
    var nsDate: Date { get }
}

/// A date for use in human communication. Named `FHIRDate` to avoid the numerous collisions with `Foundation.Date`.
/// Month and day are optional and there are no timezones.
final public class FHIRDate: Object, DateAndTime, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    
    /// The year.
    @objc public dynamic var year: Int = Calendar.current.component(.year, from: Date())
        
    private let _month = RealmOptional<Int8>()
    /// The month of the year, maximum of 12.
    public var month: Int8? {
        get {
            return _month.value
        }
        set {
            guard 1...12 ~= (newValue ?? 0) else {
                _month.value = nil
                return
            }
            
            _month.value = newValue
        }
    }
    
    private let _day = RealmOptional<Int8>()
    /// The day of the month; must be valid for the month (not enforced in code!).
    public var day: Int8? {
        get {
            return _day.value
        }
        set {
            guard 1...31 ~= (newValue ?? 0) else {
                _day.value = nil
                return
            }
            
            _day.value = newValue
        }
    }
    
    
    /**
    Dedicated initializer. Everything but the year is optional, invalid months or days will be ignored (however it is NOT checked whether
    the given month indeed contains the given day).
    
    - parameter year:  The year of the date
    - parameter month: The month of the year
    - parameter day:   The day of the month – your responsibility to ensure the month has the desired number of days; ignored if no month is
                       given
    */
    convenience public init(year: Int, month: Int8? = nil, day: Int8? = nil) {
        self.init()
        self.year = year
        self.month = month
        self.day = day
    }
    
    /**
    Initializes a date with our `DateAndTimeParser`.
    
    Will fail unless the string contains at least a valid year.
    
    - parameter string: The string to parse the date from
    */
    convenience public init?(string: String) {
        self.init()
        let parsed = DateAndTimeParser.sharedParser.parse(string: string)
        if nil == parsed.date {
            return nil
        }
        year = parsed.date!.year
        month = parsed.date!.month
        day = parsed.date!.day
    }
    
    convenience public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        guard DateAndTimeParser.sharedParser.parse(string: dateString).date != nil else {
            print("Could not inflated FHIRDate from JSON because the dateString could not be parsed: \(dateString)")
            self.init()
            return
        }
        
        self.init(string: dateString)!
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
    
    /**
    - returns: Today's date
    */
    public static var today: FHIRDate {
        let (date, _, _) = DateNSDateConverter.sharedConverter.parse(date: Date())
        return date
    }
    
    
    // MARK: Protocols
    
    public var nsDate: Date {
        return DateNSDateConverter.sharedConverter.create(fromDate: self)
    }
    
    override open static func primaryKey() -> String? { return "pk" }
    
    override public var description: String {
        if let m = month {
            if let d = day {
                return String(format: "%04d-%02d-%02d", year, m, d)
            }
            return String(format: "%04d-%02d", year, m)
        }
        return String(format: "%04d", year)
    }
    
    public static func <(lhs: FHIRDate, rhs: FHIRDate) -> Bool {
        if lhs.year == rhs.year {
            guard let lhm = lhs.month else {
                return true
            }
            guard let rhm = rhs.month else {
                return false
            }
            if lhm == rhm {
                guard let lhd = lhs.day else {
                    return true
                }
                guard let rhd = rhs.day else {
                    return false
                }
                return lhd < rhd
            }
            return lhm < rhm
        }
        return lhs.year < rhs.year
    }
    
    public static func ==(lhs: FHIRDate, rhs: FHIRDate) -> Bool {
        return lhs.year == rhs.year
            && lhs.month == rhs.month
            && lhs.day == rhs.day
    }
}

extension FHIRDate: Populatable {
    /// Updates this instance from the values stored in `other`
    ///
    /// - Parameter other: The FHIRDate whose values are to be migrated to this instance.
    /// - Warning: This function _must_ be called from within a Realm write transaction.
    public func populate(from other: Any) {
        guard let o = other as? FHIRDate else {
            print("Tried to populate a FHIRDate from \(type(of: other)). Skipping.")
            return
        }
        
        year = o.year
        month = o.month
        day = o.day
    }
}

extension FHIRDate: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return FHIRDate(string: "\(self)")!
    }
}

/**
A time during the day, optionally with seconds, usually for human communication. Named `FHIRTime` to match with `FHIRDate`.

Minimum of 00:00 and maximum of < 24:00. There is no timezone. Since decimal precision has significance in FHIR, Time initialized from a
string will remember the seconds string until it is manually set.
*/
final public class FHIRTime: Object, DateAndTime, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    
    /// The hour of the day; cannot be higher than 23.
    @objc public dynamic var hour: Int8 = 0 {
        didSet {
            if hour < 0 { hour = 0 }
            if hour > 23 { hour = 23 }
        }
    }
        
    /// The minute of the hour; cannot be larger than 59
    @objc public dynamic var minute: Int8 = 0 {
        didSet {
            if minute < 0 { minute = 0 }
            if minute > 59 { minute = 59 }
        }
    }
    
    /// The second of the minute; must be smaller than 60
    @objc public dynamic var second: Double = 0.0 {
        didSet {
            if second < 0 { second = 0 }
            if second >= 60.0 { second = 59.999999999 }
        }
    }
    
    /// If initialized from string, this was the string for the seconds; we use this to remember precision.
    @objc public internal(set) dynamic var tookSecondsFromString: String?
    
    /**
    Dedicated initializer. Overflows seconds and minutes to arrive at the final time, which must be less than 24:00:00 or it will be capped.
    
    The `secondsFromString` parameter will be discarded if it is negative or higher than 60.
    
    - parameter hour:              Hour of day, cannot be greater than 23 (a time of 24:00 is illegal)
    - parameter minute:            Minutes of the hour; if greater than 59 will roll over into hours
    - parameter second:            Seconds of the minute; if 60 or more will roll over into minutes and discard `secondsFromString`
    - parameter secondsFromString: If time was initialized from a string, you can provide the seconds string here to ensure precision is
                                   kept. You are responsible to ensure that this string actually represents what's passed into `seconds`.
    */
    public convenience init(hour: UInt8, minute: UInt8, second: Double, secondsFromString: String? = nil) {
        self.init()
        var overflowMinute: UInt = 0
        var overflowHour: UInt = 0
        
        if second >= 0.0 {
            if second >= 60.0 {
                self.second = second.truncatingRemainder(dividingBy: 60)
                overflowMinute = UInt((second - self.second) / 60)
            }
            else {
                self.second = second
                self.tookSecondsFromString = secondsFromString
            }
        }
        
        let mins = UInt(minute) + overflowMinute
        if mins > 59 {
            self.minute = Int8(UInt8(mins % 60))
            overflowHour = (mins - (mins % 60)) / 60
        }
        else {
            self.minute = Int8(mins)
        }
        
        let hrs = UInt(hour) + overflowHour
        if hrs > 23 {
            self.hour = 23
            self.minute = 59
            self.second = 59.999999999
            self.tookSecondsFromString = nil
        }
        else {
            self.hour = Int8(hrs)
        }
    }
    
    /**
    Initializes a time from a time string by passing it through `DateAndTimeParser`.
    
    Will fail unless the string contains at least hour and minute.
    */
    public convenience init?(string: String) {
        self.init()
        let parsed = DateAndTimeParser.sharedParser.parse(string: string, isTimeOnly: true)
        guard let time = parsed.time else {
            return nil
        }
        hour = time.hour
        minute = time.minute
        second = time.second
        tookSecondsFromString = time.tookSecondsFromString
    }
    
    convenience public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        guard DateAndTimeParser.sharedParser.parse(string: dateString, isTimeOnly: true).time != nil else {
            print("Could not inflated FHIRTime from JSON because the dateString could not be parsed: \(dateString)")
            self.init()
            return
        }
        
        self.init(string: dateString)!
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
    
    /**
    The time right now.
    
    - returns: The clock time of right now.
    */
    public static var now: FHIRTime {
        let (_, time, _) = DateNSDateConverter.sharedConverter.parse(date: Date())
        return time
    }
    
    
    // MARK: Protocols
    
    public var nsDate: Date {
        return DateNSDateConverter.sharedConverter.create(fromTime: self)
    }
    
    override open static func primaryKey() -> String? { return "pk" }
    
    // TODO: this implementation uses a workaround using string coercion instead of format: "%02d:%02d:%@" because %@ with String is not
    // supported on Linux (SR-957)
    public override var description: String {
        if let secStr = tookSecondsFromString {
            #if os(Linux)
            return String(format: "%02d:%02d:", hour, minute) + secStr
            #else
            return String(format: "%02d:%02d:%@", hour, minute, secStr)
            #endif
        }
        
        #if os(Linux)
            return String(format: "%02d:%02d:", hour, minute) + ((second < 10) ? "0" : "") + String(format: "%g", s)
        #else
            return String(format: "%02d:%02d:%@%g", hour, minute, (second < 10) ? "0" : "", second)
        #endif
    }
    
    public static func <(lhs: FHIRTime, rhs: FHIRTime) -> Bool {
        if lhs.hour == rhs.hour {
            if lhs.minute == rhs.minute {
                if lhs.second == rhs.second {
                    return false
                }
                return lhs.second < rhs.second
            }
            return lhs.minute < rhs.minute
        }
        return lhs.hour < rhs.hour
    }
    
    public static func ==(lhs: FHIRTime, rhs: FHIRTime) -> Bool {
        return lhs.description == rhs.description
    }
}

extension FHIRTime: Populatable {
    /// Updates this instance from the values stored in `other`
    ///
    /// - Parameter other: The FHIRTime whose values are to be migrated to this instance.
    /// - Warning: This function _must_ be called from within a Realm write transaction.
    public func populate(from other: Any) {
        guard let o = other as? FHIRTime else {
            print("Tried to populate a FHIRTime from \(type(of: other)). Skipping.")
            return
        }
        
        hour = o.hour
        minute = o.minute
        second = o.second
        tookSecondsFromString = o.tookSecondsFromString
    }
}

extension FHIRTime: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return FHIRTime(string: "\(self)")!
    }
}

/**
 A date, optionally with time, as used in human communication.
 
 If a time is specified there must be a timezone; defaults to the system reported local timezone.
 */
final public class DateTime: Object, DateAndTime, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    
    /// The original date string representing this DateTime. 
    /// Could be as simple as just a year, such as "2017", or a full ISO8601 datetime string.
    @objc public private(set) dynamic var dateString: String = ""
    
    /// The identifier for the timezone
    @objc public private(set) dynamic var timeZoneIdentifier: String?
    
    /// The timezone string seen during deserialization; to be used on serialization unless the timezone changed.
    @objc public private(set) dynamic var timeZoneString: String?
    
    /// The timezone. When set will update the `nsDate`, `timeZoneIdentifier`, and `timeZoneString` internals.
    public var timeZone: TimeZone? {
        get {
            if let identifier = timeZoneIdentifier {
                return TimeZone(identifier: identifier)
            }
            
            return nil
        }
        
        set {
            timeZoneIdentifier = newValue?.identifier
            timeZoneString = newValue?.offset();
            updateDateIfNeeded()
        }
    }
    
    @objc private dynamic var value: Date = Date()
    /// The actual Date object representing this DateTime under the hood.
    /// Since only a year is required for a DateTime, any missing value (such as month, or minute)
    /// will default to the lowest possible value.
    /// - Attention: When querying a DateTime via `nsDate`, use `value`. For example:
    ///
    /// ```
    /// // this isn't going to return much unless you have DateTimes in the future
    /// realm.objects(DateTime.self).filter('value > %@', Date())
    /// ```
    public var nsDate: Date {
        get {
            return value
        }
        
        set {
            value = newValue
            dateString = makeFormatter(in: self.timeZone).string(from: value)
        }
    }
    
    /// The FHIRDate of this DateTime
    /// - Warning: If you wish to update a DateTime's `date` directly, you _must_ re-set
    ///             the DateTime's `date` to itself afterwards. Failing to do so will fail to synchronize the DateTime
    ///             internals and you will enter a world of pain.
    ///     ```
    ///     // do this
    ///     now.date!.year = 2015
    ///     now.date = now.date!
    ///     print(now.nsDate)
    ///     > 2015-06-15T17:52:17.764-04:00
    ///
    ///     // or this
    ///     let now = DateTime.now
    ///     let newDate = FHIRDate(year: 2017, month: 6, day: 15)
    ///     let now.date = newDate
    ///     print(now.nsDate)
    ///     > 2017-06-15T17:52:17.764-04:00
    ///     // if the DateTime is already saved you'll need to delete the now.date before assigning now.date,
    ///     // otherwise Realm will orphan that date time.
    ///
    ///     // but don't just do this or else you will eventually cry at 2am.
    ///     // note how the `nsDate` is now out of synch, and still sitting around in 2015
    ///     now.date!.year = 2013
    ///     print(now.nsDate)
    ///     > 2015-06-15T17:52:17.764-04:00
    ///     ```
    /// - Attention: This property is not persisted, and is instead computed from the DateTime internals.
    public var date: FHIRDate? {
        get {
            let (date, _, _, _) = DateAndTimeParser.sharedParser.parse(string: self.dateString)
            return date
        }
        
        set {
            let d = makeDate(newValue, time: time, timeZone: timeZone)
            nsDate = d
        }
    }
    
    /// The FHIRTime of this DateTime
    /// - Warning: If you wish to update a DateTime's `time` directly, you _must_ re-set
    ///             the DateTime's `time` to itself afterwards. Failing to do so will fail to synchronize the DateTime
    ///             internals and you will enter a world of pain. This works identically to `date`.
    ///             See `date` for further details.
    /// - Attention: This property is not persisted, and is instead computed from the DateTime internals.
    public var time: FHIRTime? {
        get {
            let (_, time, _, _) = DateAndTimeParser.sharedParser.parse(string: self.dateString)
            return time
        }
        
        set {
            let d = makeDate(date, time: newValue, timeZone: timeZone)
            nsDate = d
        }
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["date", "time", "timeZone", "nsDate"]
    }
    
    /// A DateTime instance representing current date and time, in the current timezone.
    public static var now: DateTime {
        // we need to shift the date over such that when assigned the local timezone
        // the date/time is actually right. Without doing this then we will be off by
        // whatever the actual timezone offset is.
        let comp = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
        let localDate = Calendar.current.date(from: comp)!
        return DateTime(string: localFormatter.string(from: localDate))!
    }
    
    /// Designated initializer, takes a date and optionally a time and a timezone.
    ///
    /// If time is given but no timezone, the instance is assigned the local time zone.
    ///
    /// - Parameters:
    ///   - date: The date of the DateTime
    ///   - time: The time of the DateTime
    ///   - timeZone: The timezone. Will default to TimeZone.current if not provided.
    public convenience init(date: FHIRDate, time: FHIRTime? = nil, timeZone: TimeZone?) {
        self.init()
        
        if time != nil {
            let tz = timeZone ?? TimeZone.current
            timeZoneIdentifier = tz.identifier
            timeZoneString = tz.offset()
        }

        self.dateString = makeDescription(date: date, time: time)
        self.value = makeDate(date, time: time, timeZone: timeZone ?? TimeZone.current)
    }
    
    /**
     Uses `DateAndTimeParser` to initialize from a date-time string.
     
     If time is given but no timezone, the instance is assigned the local time zone.
     
     - parameter string: The string the date-time is parsed from
     */
    public convenience init?(string: String) {
        let (date, time, tz, tzString) = DateAndTimeParser.sharedParser.parse(string: string)
        
        guard let d = date else {
            return nil
        }
        
        self.init(date: d, time: time, timeZone: tz)
        self.dateString = string
        self.timeZoneString = tzString
    }
    
    convenience public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        guard DateAndTimeParser.sharedParser.parse(string: dateString).date != nil else {
            print("Could not inflated DateTime from JSON because the dateString could not be parsed: \(dateString)")
            self.init()
            return
        }
        
        self.init(string: dateString)!
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
    
    private func makeDescription(date: FHIRDate?, time: FHIRTime?) -> String {
        if let tm = time, let tz = timeZoneString ?? timeZone?.offset() {
            return "\((date ?? FHIRDate.today).description)T\(tm.description)\(tz)"
        }
        
        return (date ?? FHIRDate.today).description
    }
    
    override open static func primaryKey() -> String? { return "pk" }
    
    public override var description: String {
        return makeDescription(date: date, time: time)
    }
    
    public static func <(lhs: DateTime, rhs: DateTime) -> Bool {
        let lhd = lhs.nsDate
        let rhd = rhs.nsDate
        return (lhd.compare(rhd) == .orderedAscending)
    }
    
    public static func ==(lhs: DateTime, rhs: DateTime) -> Bool {
        let lhd = lhs.nsDate
        let rhd = rhs.nsDate
        return (lhd.compare(rhd) == .orderedSame)
    }
    
    private func updateDateIfNeeded() {
        let d = makeDate(date, time: time, timeZone: timeZone)
        if d != nsDate { nsDate = d }
    }
}

extension DateTime: Populatable {
    /// Updates this instance from the values stored in `other`
    ///
    /// - Parameter other: The DateTime whose values are to be migrated to this instance.
    /// - Warning: This function _must_ be called from within a Realm write transaction.
    public func populate(from other: Any) {
        guard let o = other as? DateTime else {
            print("Tried to populate a DateTime from \(type(of: other)). Skipping.")
            return
        }
        
        timeZone = o.timeZone
        dateString = o.dateString
        value = o.value
    }
}

extension DateTime: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return DateTime(string: "\(self)")!
    }
}

/**
An instant in time, known at least to the second and with a timezone, for machine times.
*/
final public class Instant: Object, DateAndTime, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    
    /// The original date string representing this DateTime.
    /// Could be as simple as just a year, such as "2017", or a full ISO8601 datetime string.
    @objc public private(set) dynamic var dateString = ""
    
    /// The FHIRDate of this `Instant`
    /// - Warning: If you wish to update a DateTime's `date` directly, you _must_ re-set
    ///             the DateTime's `date` to itself afterwards. Failing to do so will fail to synchronize the DateTime
    ///             internals and you will enter a world of pain.
    ///     ```
    ///     // do this
    ///     now.date!.year = 2015
    ///     now.date = now.date!
    ///     print(now.nsDate)
    ///     > 2015-06-15T17:52:17.764-04:00
    ///
    ///     // or this
    ///     let now = DateTime.now
    ///     let newDate = FHIRDate(year: 2017, month: 6, day: 15)
    ///     let now.date = newDate
    ///     print(now.nsDate)
    ///     > 2017-06-15T17:52:17.764-04:00
    ///     // if the DateTime is already saved you'll need to delete the now.date before assigning now.date,
    ///     // otherwise Realm will orphan that date time.
    ///
    ///     // but don't just do this or else you will eventually cry at 2am.
    ///     // note how the `nsDate` is now out of synch, and still sitting around in 2015
    ///     now.date!.year = 2013
    ///     print(now.nsDate)
    ///     > 2015-06-15T17:52:17.764-04:00
    ///     ```
    /// - Attention: This property is not persisted, and is instead computed from the DateTime internals.
    public var date: FHIRDate {
        get {
            let (date, _, _, _) = DateAndTimeParser.sharedParser.parse(string: self.dateString)
            return date ?? FHIRDate.today
        }
        
        set {
            if nil == newValue.day {
                newValue.day = 1
            }
            
            if nil == newValue.month {
                newValue.month = 1
            }
            
            let d = makeDate(newValue, time: time, timeZone: timeZone)
            nsDate = d
        }
    }
    
    /// The FHIRTime of this `Instant`
    /// - Warning: If you wish to update a DateTime's `time` directly, you _must_ re-set
    ///             the DateTime's `time` to itself afterwards. Failing to do so will fail to synchronize the DateTime
    ///             internals and you will enter a world of pain. This works identically to `date`.
    ///             See `date` for further details.
    /// - Attention: This property is not persisted, and is instead computed from the DateTime internals.
    public var time: FHIRTime {
        get {
            let (_, time, _, _) = DateAndTimeParser.sharedParser.parse(string: self.dateString)
            return time!
        }
        
        set {
            let d = makeDate(date, time: newValue, timeZone: timeZone)
            nsDate = d
        }
    }
    
    /// The identifier for the timezone
    @objc public private(set) dynamic var timeZoneIdentifier: String = TimeZone.current.identifier
    
    /// The timezone string seen during deserialization; to be used on serialization unless the timezone changed.
    @objc public private(set) dynamic var timeZoneString: String = TimeZone.current.offset()
    
    /// The timezone. When set will update the `nsDate`, `timeZoneIdentifier`, and `timeZoneString` internals.
    public var timeZone: TimeZone {
        get {
            return TimeZone(identifier: timeZoneIdentifier)!
        }
        
        set {
            timeZoneIdentifier = newValue.identifier
            timeZoneString = newValue.offset();
            updateDateIfNeeded()
        }
    }
    
    @objc private dynamic var value: Date = Date()
    /// The actual Date object representing this DateTime under the hood.
    /// Since only a year is required for a DateTime, any missing value (such as month, or minute)
    /// will default to the lowest possible value.
    /// - Attention: When querying a DateTime via `nsDate`, use `value`. For example:
    ///
    /// ```
    /// // this isn't going to return much unless you have DateTimes in the future
    /// realm.objects(DateTime.self).filter('value > %@', Date())
    /// ```
    public var nsDate: Date {
        get {
            return value
        }
        
        set {
            value = newValue
            dateString = Instant.makeFormatter(in: self.timeZone).string(from: value)
        }
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["date", "time", "timeZone", "nsDate"]
    }
    
    private static func makeFormatter(in timeZone: TimeZone?) -> DateFormatter {
        let f = DateFormatter()
        f.calendar = Calendar(identifier: .iso8601)
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        
        if timeZone != nil {
            f.timeZone = timeZone
        }
        
        return f
    }
    
    private static var localFormatter: DateFormatter {
        return makeFormatter(in: TimeZone.current)
    }
    
    /**
    This very instant.
    
    - returns: An Instant instance representing current date and time in the current timezone.
    */
    public static var now: Instant {
        // we need to shift the date over such that when assigned the local timezone
        // the date/time is actually right. Without doing this then we will be off by
        // twice as much as to whatever the actual timezone offset is.
        let comp = Calendar.current.dateComponents(in: TimeZone.current, from: Date())
        let localDate = Calendar.current.date(from: comp)!
        return Instant(string: localFormatter.string(from: localDate))!
    }
    
    /**
    Designated initializer.
    
    - parameter date:     The date of the instant; ensures to have month and day (which are optional in the `FHIRDate` construct)
    - parameter time:     The time of the instant; ensures to have seconds (which are optional in the `FHIRTime` construct)
    - parameter timeZone: The timezone
    */
    public convenience init(date: FHIRDate, time: FHIRTime, timeZone: TimeZone) {
        self.init()
        if date.month == nil { date.month = 1 }
        if date.day == nil { date.day = 1 }
        
        self.value = makeDate(date, time: time, timeZone: timeZone)
        self.timeZoneIdentifier = timeZone.identifier
        self.timeZoneString = timeZone.offset()
        
        if dateString == "" {
            self.dateString = makeDescription(date: date, time: time, timeZoneString: timeZoneString)
        }
    }
    
    /** Uses `DateAndTimeParser` to initialize from a date-time string.
    
    - parameter string: The string to parse the instant from
    */
    public convenience init?(string: String) {
        self.init()
        let (d, t, tz, tzString) = DateAndTimeParser.sharedParser.parse(string: string)
        guard let date = d, date.month != nil, date.day != nil, let time = t, let timeZone = tz else {
            return nil
        }
        
        self.dateString = string
        self.value = makeDate(date, time: time, timeZone: timeZone)
        self.timeZoneIdentifier = timeZone.identifier
        self.timeZoneString = tzString!
    }
    
    convenience public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        let (d, t, tz, _) = DateAndTimeParser.sharedParser.parse(string: dateString)
        guard let date = d, date.month != nil, date.day != nil, t != nil, tz != nil else {
            print("Could not inflated Instant from JSON because the dateString could not be parsed: \(dateString)")
            self.init()
            return
        }
        
        self.init(string: dateString)!
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.description)
    }
    
    private func updateDateIfNeeded() {
        let d = makeDate(date, time: time, timeZone: timeZone)
        if d != nsDate { nsDate = d }
    }
    
    private func makeDescription(date: FHIRDate, time: FHIRTime, timeZoneString: String) -> String{
        return "\(date.description)T\(time.description)\(timeZoneString)"
    }
    
    public override var description: String {
        return makeDescription(date: date, time: time, timeZoneString: timeZoneString)
    }
    
    override open static func primaryKey() -> String? { return "pk" }
    
    public static func <(lhs: Instant, rhs: Instant) -> Bool {
        let lhd = lhs.nsDate
        let rhd = rhs.nsDate
        return (lhd.compare(rhd) == .orderedAscending)
    }
    
    public static func ==(lhs: Instant, rhs: Instant) -> Bool {
        let lhd = lhs.nsDate
        let rhd = rhs.nsDate
        return (lhd.compare(rhd) == .orderedSame)
    }
}

extension Instant {
    
    /**
    Attempts to parse an Instant from RFC1123-formatted date strings, usually used by HTTP headers:
    
    - "EEE',' dd MMM yyyy HH':'mm':'ss z"
    - "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z" (RFC850)
    - "EEE MMM d HH':'mm':'ss yyyy"
    
    Created by taking liberally from Marcus Rohrmoser's blogpost at http://blog.mro.name/2009/08/nsdateformatter-http-header/
    
    - parameter httpDate: The date string to parse
    - returns: An Instant if parsing was successful, nil otherwise
    */
    public static func fromHttpDate(_ httpDate: String) -> Instant? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation: "GMT")
        formatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss z"
        if let date = formatter.date(from: httpDate) {
            return date.fhir_asInstant()
        }
        
        formatter.dateFormat = "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z"
        if let date = formatter.date(from: httpDate) {
            return date.fhir_asInstant()
        }
        
        formatter.dateFormat = "EEE MMM d HH':'mm':'ss yyyy"
        if let date = formatter.date(from: httpDate) {
            return date.fhir_asInstant()
        }
        return nil
    }
}

extension Instant: Populatable {
    /// Updates this instance from the values stored in `other`
    ///
    /// - Parameter other: The Instant whose values are to be migrated to this instance.
    /// - Warning: This function _must_ be called from within a Realm write transaction.
    public func populate(from other: Any) {
        guard let o = other as? Instant else {
            print("Tried to populate a Instant from \(type(of: other)). Skipping.")
            return
        }
        
        timeZone = o.timeZone
        dateString = o.dateString
        value = o.value
    }
}

extension Instant: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return Instant(string: "\(self)")!
    }
}

/**
Converts between NSDate and our FHIRDate, FHIRTime, DateTime and Instance structs.
*/
class DateNSDateConverter {
    
    /// The singleton instance
    static var sharedConverter = DateNSDateConverter()
    
    let calendar: Calendar
    let utc: TimeZone
    
    init() {
        utc = TimeZone(abbreviation: "UTC")!
        var cal = Calendar(identifier: Calendar.Identifier.gregorian)
        cal.timeZone = utc
        calendar = cal
    }
    
    
    // MARK: Parsing
    
    /**
    Execute parsing. Will use `calendar` to split the Date into components.
    
    - parameter date: The Date to parse into structs
    - returns: A tuple with (FHIRDate, FHIRTime, TimeZone)
    */
    func parse(date inDate: Date) -> (FHIRDate, FHIRTime, TimeZone) {
        let flags: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second, .nanosecond, .timeZone]
        let comp = calendar.dateComponents(flags, from: inDate)
        
        let date = FHIRDate(year: comp.year!, month: Int8(comp.month!), day: Int8(comp.day!))
        let zone = comp.timeZone ?? utc
        let secs = Double(comp.second!) + (Double(comp.nanosecond!) / 1000000000)
        let time = FHIRTime(hour: UInt8(comp.hour!), minute: UInt8(comp.minute!), second: secs)
        
        return (date, time, zone)
    }
    
    
    // MARK: Creation
    
    func create(fromDate date: FHIRDate) -> Date {
        return _create(date: date, time: nil, timeZone: nil)
    }
    
    func create(fromTime time: FHIRTime) -> Date {
        return _create(date: nil, time: time, timeZone: nil)
    }
    
    func create(date: FHIRDate, time: FHIRTime, timeZone: TimeZone) -> Date {
        return _create(date: date, time: time, timeZone: timeZone)
    }
    
    func _create(date: FHIRDate?, time: FHIRTime?, timeZone: TimeZone?) -> Date {
        var comp = DateComponents()
        comp.timeZone = timeZone ?? utc
        
        if let yr = date?.year {
            comp.year = yr
        }
        if let mth = date?.month {
            comp.month = Int(mth)
        }
        if let d = date?.day {
            comp.day = Int(d)
        }
        
        if let hr = time?.hour {
            comp.hour = Int(hr)
        }
        if let min = time?.minute {
            comp.minute = Int(min)
        }
        if let sec = time?.second {
            comp.second = Int(floor(sec))
            comp.nanosecond = Int(sec.truncatingRemainder(dividingBy: 1000000000))
        }
        
        return calendar.date(from: comp) ?? Date()
    }
}


/**
Parses Date and Time from strings in a narrow set of the extended ISO 8601 format.
*/
class DateAndTimeParser {
    
    /// The singleton instance
    static var sharedParser = DateAndTimeParser()
    
    /**
    Parses a date string in "YYYY[-MM[-DD]]" and a time string in "hh:mm[:ss[.sss]]" (extended ISO 8601) format,
    separated by "T" and followed by either "Z" or a valid time zone offset in the "±hh[:?mm]" format.
    
    Does not currently check if the day exists in the given month.
    
    - parameter string:     The date string to parse
    - parameter isTimeOnly: If true assumes that the string describes time only
    - returns:              A tuple with (FHIRDate?, FHIRTime?, TimeZone?, String? [for time zone])
    */
    func parse(string: String, isTimeOnly: Bool=false) -> (date: FHIRDate?, time: FHIRTime?, tz: TimeZone?, tzString: String?) {
        let scanner = Scanner(string: string)
        var date: FHIRDate?
        var time: FHIRTime?
        var tz: TimeZone?
        var tzString: String?
        
        // scan date (must have at least the year)
        if !isTimeOnly {
            if let year = scanner.fhir_scanInt(), year < 10000 {            // dates above 9999 are considered special cases
                if nil != scanner.fhir_scanString("-"), let month = scanner.fhir_scanInt(), month <= 12 {
                    if nil != scanner.fhir_scanString("-"), let day = scanner.fhir_scanInt(), day <= 31 {
                        date = FHIRDate(year: Int(year), month: Int8(month), day: Int8(day))
                    }
                    else {
                        date = FHIRDate(year: Int(year), month: Int8(month), day: nil)
                    }
                }
                else {
                    date = FHIRDate(year: Int(year), month: nil, day: nil)
                }
            }
        }
        
        // scan time
        if isTimeOnly || nil != scanner.fhir_scanString("T") {
            if let hour = scanner.fhir_scanInt(), hour >= 0 && hour < 24 && nil != scanner.fhir_scanString(":"),
                let minute = scanner.fhir_scanInt(), minute >= 0 && minute < 60 {
                
                let digitSet = CharacterSet.decimalDigits
                var decimalSet = NSMutableCharacterSet.decimalDigits
                decimalSet.insert(".")
                
                if nil != scanner.fhir_scanString(":"), let secStr = scanner.fhir_scanCharacters(from: decimalSet as CharacterSet), let second = Double(secStr), second < 60.0 {
                    time = FHIRTime(hour: UInt8(hour), minute: UInt8(minute), second: second, secondsFromString: secStr)
                }
                else {
                    time = FHIRTime(hour: UInt8(hour), minute: UInt8(minute), second: 0)
                }
                
                // scan zone
                if !scanner.fhir_isAtEnd {
                    if nil != scanner.fhir_scanString("Z") {
                        tz = TimeZone(abbreviation: "UTC")
                        tzString = "Z"
                    }
                    else if var tzStr = (scanner.fhir_scanString("-") ?? scanner.fhir_scanString("+")) {
                        if let hourStr = scanner.fhir_scanCharacters(from: digitSet) {
                            tzStr += hourStr
                            var tzhour = 0
                            var tzmin = 0
                            if 2 == hourStr.characters.count {
                                tzhour = Int(hourStr) ?? 0
                                if nil != scanner.fhir_scanString(":"), let tzm = scanner.fhir_scanInt() {
                                    tzStr += (tzm < 10) ? ":0\(tzm)" : ":\(tzm)"
                                    if tzm < 60 {
                                        tzmin = tzm
                                    }
                                }
                            }
                            else if 4 == hourStr.characters.count {
                                tzhour = Int(hourStr[..<hourStr.index(hourStr.startIndex, offsetBy: 2)])!
                                tzmin = Int(hourStr[hourStr.index(hourStr.startIndex, offsetBy: 2)...])!
                            }
                            
                            let offset = tzhour * 3600 + tzmin * 60
                            tz = TimeZone(secondsFromGMT:tzStr.hasPrefix("+") ? offset : -1 * offset)
                            tzString = tzStr
                        }
                    }
                }
            }
        }
        
        return (date, time, tz, tzString)
    }
}


/**
Extend Date to be able to return DateAndTime instances.
*/
public extension Date {
    
    /** Create a `FHIRDate` instance from the receiver. */
    func fhir_asDate() -> FHIRDate {
        let (date, _, _) = DateNSDateConverter.sharedConverter.parse(date: self)
        return date
    }
    
    /** Create a `Time` instance from the receiver. */
    func fhir_asTime() -> FHIRTime {
        let (_, time, _) = DateNSDateConverter.sharedConverter.parse(date: self)
        return time
    }
    
    /** Create a `DateTime` instance from the receiver. */
    func fhir_asDateTime() -> DateTime {
        let (date, time, tz) = DateNSDateConverter.sharedConverter.parse(date: self)
        return DateTime(date: date, time: time, timeZone: tz)
    }
    
    /** Create an `Instance` instance from the receiver. */
    func fhir_asInstant() -> Instant {
        let (date, time, tz) = DateNSDateConverter.sharedConverter.parse(date: self)
        return Instant(date: date, time: time, timeZone: tz)
    }
}


/**
Extend TimeZone to report the offset in "+00:00" or "Z" (for UTC/GMT) format.
*/
extension TimeZone {
    
    /**
    Return the offset as a string string.
    
    - returns: The offset as a string; uses "Z" if the timezone is UTC or GMT
    */
    func offset() -> String {
        if "UTC" == identifier || "GMT" == identifier {
            return "Z"
        }
        
        let secsFromGMT = secondsFromGMT()
        let hr = abs((secsFromGMT / 3600) - (((secsFromGMT % 3600) / 3600) * 60))
        let min = abs((secsFromGMT % 3600) / 60)
        
        return (secsFromGMT >= 0 ? "+" : "-") + String(format: "%02d:%02d", hr, min)
    }
}

/**
Extend Scanner to account for interface differences between macOS and Linux (as of November 2016)
*/
extension Scanner {
    
    public var fhir_isAtEnd: Bool {
        #if os(Linux)
        return atEnd
        #else
        return isAtEnd
        #endif
    }
    
    public func fhir_scanString(_ searchString: String) -> String? {
        #if os(Linux)
        return scanString(string: searchString)
        #else
        var str: NSString?
        if scanString(searchString, into: &str) {
            return str as String?
        }
        return nil
        #endif
    }
    
    public func fhir_scanCharacters(from set: CharacterSet) -> String? {
        #if os(Linux)
        return scanCharactersFromSet(set)
        #else
        var str: NSString?
        if scanCharacters(from: set, into: &str) {
            return str as String?
        }
        return nil
        #endif
    }
    
    public func fhir_scanInt() -> Int? {
        var int = 0
        #if os(Linux)
        let flag = scanInteger(&int)
        #else
        let flag = scanInt(&int)
        #endif
        return flag ? int : nil
    }
}

fileprivate func makeFormatter(in timeZone: TimeZone?) -> DateFormatter {
    let f = DateFormatter()
    f.calendar = Calendar(identifier: .iso8601)
    f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
    
    if timeZone != nil {
        f.timeZone = timeZone
    }
    
    return f
}

fileprivate var localFormatter: DateFormatter {
    return makeFormatter(in: TimeZone.current)
}

fileprivate func makeDate(_ date: FHIRDate?, time: FHIRTime?, timeZone: TimeZone?) -> Date {
    if let time = time, let tz = timeZone {
        return DateNSDateConverter.sharedConverter.create(date: date ?? FHIRDate.today,
                                                          time: time, timeZone: tz)
    }
    return DateNSDateConverter.sharedConverter.create(fromDate: date ?? FHIRDate.today)
}
