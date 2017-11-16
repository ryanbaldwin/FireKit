//
//  DateAndTimeTests.swift
//  SwiftFHIR
//
//  Created by Pascal Pfiffner on 1/19/15.
//  2015, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import XCTest
@testable import FireKit


class DateTests: XCTestCase {
	
	func testParsing() {
		var d = FHIRDate(string: "2015")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.year)
		XCTAssertTrue(nil == d!.month)
		XCTAssertTrue(nil == d!.day)
		
		d = FHIRDate(string: "2015-83")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.year)
		XCTAssertTrue(nil == d!.month)
		XCTAssertTrue(nil == d!.day)
		
		d = FHIRDate(string: "2015-03")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.year)
		XCTAssertEqual(Int8(3), d!.month!)
		XCTAssertTrue(nil == d!.day)
		
		d = FHIRDate(string: "2015-03-54")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.year)
		XCTAssertEqual(Int8(3), d!.month!)
		XCTAssertTrue(nil == d!.day)
		
		d = FHIRDate(string: "2015-03-28")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.year)
		XCTAssertEqual(Int8(3), d!.month!)
		XCTAssertEqual(Int8(28), d!.day!)
		
		d = FHIRDate(string: "abc")
		XCTAssertTrue(nil == d)
		
		d = FHIRDate(string: "201512")
		XCTAssertTrue(nil == d)
		
		d = FHIRDate(string: "2015-123-456")!
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.year)
		XCTAssertTrue(nil == d!.month)
		XCTAssertTrue(nil == d!.day)
	}
	
	func testComparisons() {
		var a = FHIRDate(string: "2014")!
		var b = FHIRDate(string: "1914")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRDate(string: "2014-12")!
		b = FHIRDate(string: "2014-11")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRDate(string: "2014-11-25")!
		b = FHIRDate(string: "2014-11-24")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRDate(string: "2014-11-24")!
		b = FHIRDate(string: "1914-11-24")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRDate(string: "2014-12-24")!
		b = FHIRDate(string: "2014-11-24")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
	}
	
	func testConversion() {
		let date = FHIRDate(string: "1981-03-28")!
		let ns = date.nsDate
        XCTAssertTrue(date == ns.fhir_asDate(), "Conversion to NSDate and back again must not alter `Date`")
	}
    
    func testPopulate() {
        let date = FHIRDate(string: "1981-03-28")!
        let other = FHIRDate(string: "1978-11-24")!
        date.populate(from: other)
        
        XCTAssertEqual(date.year, other.year)
        XCTAssertEqual(date.month, other.month)
        XCTAssertEqual(date.day, other.day)
    }
}


class TimeTests: XCTestCase {
	
	func testParsing() {
		var t = FHIRTime(string: "18")
		XCTAssertTrue(nil == t)
		
		t = FHIRTime(string: "18:72")
		XCTAssertTrue(nil == t)
		
		t = FHIRTime(string: "25:44")
		XCTAssertTrue(nil == t)
		
		t = FHIRTime(string: "18:44")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertTrue(0 == t!.second)
		
		t = FHIRTime(string: "00:00:00")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(0), t!.hour)
		XCTAssertEqual(Int8(0), t!.minute)
		XCTAssertEqual(0.0, t!.second)
		
		t = FHIRTime(string: "18:44:88")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertTrue(0 == t!.second)
		
		t = FHIRTime(string: "18:44:-4")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertTrue(0 == t!.second)
		
		t = FHIRTime(string: "18:44:02")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertEqual(2.0, t!.second)
		
		t = FHIRTime(string: "18:44:02.2912")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertEqual(2.2912, t!.second)
		
		t = FHIRTime(string: "18:74:28.0381")
		XCTAssertTrue(nil == t)
		
		t = FHIRTime(string: "18:-32:28.0381")
		XCTAssertTrue(nil == t)
		
		t = FHIRTime(string: "18:44:-28.0381")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertTrue(0 == t!.second)
		
		t = FHIRTime(string: "18:44:28.038100")
		XCTAssertFalse(nil == t)
		XCTAssertEqual(Int8(18), t!.hour)
		XCTAssertEqual(Int8(44), t!.minute)
		XCTAssertEqual(28.0381, t!.second)
		XCTAssertEqual(t!.description, "18:44:28.038100", "must preserve precision")
		
		t = FHIRTime(string: "abc")
		XCTAssertTrue(nil == t)
	}
	
	func testComparisons() {
		var a = FHIRTime(string: "19:12")!
		var b = FHIRTime(string: "19:11")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRTime(string: "19:11:04")!
		b = FHIRTime(string: "19:11:03")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRTime(string: "19:11:04")!
		b = FHIRTime(string: "07:11:05")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRTime(string: "19:00:04")!
		b = FHIRTime(string: "07:11:05")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRTime(string: "19:11:04")!
		b = FHIRTime(string: "19:11")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRTime(string: "19:11:04.0002")!
		b = FHIRTime(string: "19:11:04")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = FHIRTime(string: "19:11:04.0002")!
		b = FHIRTime(hour: 19, minute: 11, second: 4.0002)
		XCTAssertFalse(a > b)
		XCTAssertTrue(a == b)
		
		a = FHIRTime(string: "19:11:04.000200")!
		b = FHIRTime(hour: 19, minute: 11, second: 4.0002)
		XCTAssertFalse(a > b)
		XCTAssertFalse(a < b)
		XCTAssertFalse(a == b)
	}
	
	func testConversion() {
		let time = FHIRTime(string: "15:42:03")!
		let ns = time.nsDate
        XCTAssertTrue(time == ns.fhir_asTime(), "Conversion to NSDate and back again must not alter `Time`")
	}
    
    func testPopulate() {
        let time = FHIRTime(string: "15:42:03")!
        let other = FHIRTime(string: "00:00:01")!
        time.populate(from: other)
        
        XCTAssertEqual(time.hour, other.hour)
        XCTAssertEqual(time.minute, other.minute)
        XCTAssertEqual(time.second, other.second)
        XCTAssertEqual(time.tookSecondsFromString, other.tookSecondsFromString)
    }
}


class DateTimeTests: XCTestCase, RealmPersistenceTesting {
	
	func testParseAllCorrect() {
		var d = DateTime(string: "2015")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertTrue(nil == d!.date?.month)
		XCTAssertTrue(nil == d!.time)
        XCTAssertEqual("2015", d!.description)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertTrue(nil == d!.date?.day)
		XCTAssertTrue(nil == d!.time)
        XCTAssertEqual("2015-03", d!.description)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03-28")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertTrue(nil == d!.time)
        XCTAssertEqual("2015-03-28", d!.description)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03-28T02:33")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
        XCTAssertNotNil(d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertTrue(0 == d!.time!.second)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertEqual(TimeZone.current, d!.timeZone!, "Must default to the local timezone")
		
		d = DateTime(string: "2015-03-28T02:33:29")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29, d!.time!.second)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertEqual(TimeZone.current, d!.timeZone!, "Should default to local time zone but have \(String(describing: d!.timeZone))")
		
		d = DateTime(string: "2015-03-28T02:33:29+01:00")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29+01:00", d!.description)
        XCTAssertNotNil(d!.timeZone)
		XCTAssertTrue(3600 == d!.timeZone!.secondsFromGMT(), "Should be 3600 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29-05:00")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29-05:00", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-18000 == d!.timeZone!.secondsFromGMT(), "Should be 18000 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29.1285-05:00")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29.1285, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29.1285-05:00", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-18000 == d!.timeZone!.secondsFromGMT(), "Should be 18000 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29.1285-05:30")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29.1285, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29.1285-05:30", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-19800 == d!.timeZone!.secondsFromGMT(), "Should be 19800 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29.128500-05:30")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29.1285, d!.time!.second)
		XCTAssertEqual("2015-03-28T02:33:29.128500-05:30", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-19800 == d!.timeZone!.secondsFromGMT(), "Should be 19800 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29-05")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29-05", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-18000 == d!.timeZone!.secondsFromGMT(), "Should be 18000 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29.1285-0500")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29.1285, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29.1285-0500", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-18000 == d!.timeZone!.secondsFromGMT(), "Should be 18000 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
		
		d = DateTime(string: "2015-03-28T02:33:29.1285-0530")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29.1285, d!.time!.second)
        XCTAssertEqual("2015-03-28T02:33:29.1285-0530", d!.description)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertTrue(-19800 == d!.timeZone!.secondsFromGMT(), "Should be 19800 seconds ahead, but am \(d!.timeZone!.secondsFromGMT()) seconds")
	}
	
	func testSomeRealmPersistence() {
        let d = DateTime.now
        let inMemJSON = d.asJSON()
        XCTAssertNotNil(d.timeZoneString)
        
        let realm = self.makeRealm()
        try! realm.write { realm.add(d) }
        
        let fetched = realm.objects(DateTime.self).first
        XCTAssertNotNil(fetched)
        
        XCTAssertEqual(inMemJSON, fetched?.asJSON())
        
        try! realm.write { fetched?.timeZone = TimeZone(abbreviation: "GMT") }
        XCTAssertNotEqual(inMemJSON, fetched?.asJSON())
    }

	func testParseSomeFails() {
		var d: DateTime?
//		d = DateTime(string: "02015")	// should probably fail, currently doesn't
//		XCTAssertTrue(nil == d)
		
		d = DateTime(string: "2015-103")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertTrue(nil == d!.date?.month)
		XCTAssertTrue(nil == d!.date?.day)
		XCTAssertTrue(nil == d!.time)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03-208")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertTrue(nil == d!.date?.day)
		XCTAssertTrue(nil == d!.time)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03-28 02:33")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertTrue(nil == d!.time)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03-28T02-33-29")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertTrue(nil == d!.time)
		XCTAssertTrue(nil == d!.timeZone)
		
		d = DateTime(string: "2015-03-28T02:33:29GMT")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date?.year)
		XCTAssertEqual(Int8(3), d!.date?.month!)
		XCTAssertEqual(Int8(28), d!.date?.day!)
		XCTAssertFalse(nil == d!.time)
		XCTAssertEqual(Int8(2), d!.time!.hour)
		XCTAssertEqual(Int8(33), d!.time!.minute)
		XCTAssertEqual(29, d!.time!.second)
		XCTAssertFalse(nil == d!.timeZone)
		XCTAssertEqual(TimeZone.current, d!.timeZone!, "Should default to local time zone but have \(String(describing: d!.timeZone))")
	}
	
	func testComparisons() {
		var a = DateTime(string: "2014")!
		var b = DateTime(string: "1914")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T03:11")!
		b = DateTime(string: "2015-03-28T03:10")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T03:11:04")!
		b = DateTime(string: "2015-03-28T03:11:03")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T03:11:04")!
		b = DateTime(string: "2015-03-28T03:11:04")!
		XCTAssertFalse(a > b)
		XCTAssertTrue(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T03:11:04Z")!
		b = DateTime(string: "1915-03-28T03:11:04Z")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T03:11:04Z")!
		b = DateTime(string: "2015-03-28T03:11:04+00:00")!
		XCTAssertFalse(a > b)
		XCTAssertTrue(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T03:11+00:00")!
		b = DateTime(string: "2015-03-28T03:17+01:00")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-27T22:12:44-05:00")!
		b = DateTime(string: "2015-03-28T03:12:43-00:00")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = DateTime(string: "2015-03-28T05:11:44.3+01:00")!
		b = DateTime(string: "2015-03-27T23:11:44.3-05:00")!
		XCTAssertFalse(a > b)
		XCTAssertTrue(a == b)
		XCTAssertTrue(a == a)
	}
	
	func testConversion() {
		let dt = DateTime(string: "1981-03-28T15:42:03")!
		let ns = dt.nsDate
        XCTAssertTrue(dt == ns.fhir_asDateTime(), "Conversion to NSDate and back again must not alter `DateTime`")
		
		let dt2 = DateTime(string: "1981-03-28T15:42:03-0100")!
		let ns2 = dt2.nsDate
        XCTAssertTrue(dt2 == ns2.fhir_asDateTime(), "Conversion to NSDate and back again must not alter `DateTime`")		
	}
    
    func testTimezoneIsPersistedWhenDateIsSaved() {
        let realm = makeRealm()
        let now = DateTime.now
        XCTAssertNotNil(now.timeZone)
        
        try! realm.write { realm.add(now) }
        
        let then = realm.objects(DateTime.self).first!
        XCTAssertNotNil(then.timeZone)
        
        try! realm.write {
            then.timeZone = TimeZone(secondsFromGMT: 3600)
        }
        
        let neverland = realm.objects(DateTime.self).first!
        XCTAssertNotNil(neverland.timeZone)
    }
    
    func testDateTimeNowIsCorrectlySetToLocalTime() {
        let dtNow = DateTime.now
        let nsNow = Date()
        let result = Calendar.current.compare(dtNow.nsDate, to: nsNow, toGranularity: .second)
        XCTAssertEqual(result, ComparisonResult.orderedSame)
        
        // make sure it's still equal after we re-inflate it from Realm
        let realm = makeRealm()
        try! realm.write { realm.add(dtNow) }
        let dtNow2 = realm.objects(DateTime.self).first!
        let result2 = Calendar.current.compare(dtNow2.nsDate, to: nsNow, toGranularity: .second)
        XCTAssertEqual(result2, ComparisonResult.orderedSame)
    }
    
    func testUpdatingTimeZoneUpdatesTheNsDate() {
        let now = DateTime.now
        let nowDate = now.nsDate
        let nowString = now.dateString
        
        now.timeZone = TimeZone(secondsFromGMT: now.timeZone!.secondsFromGMT() - 3600) // go one hour into the past
        XCTAssertNotEqual(now.nsDate, nowDate)
        XCTAssertNotEqual(now.dateString, nowString)
    }
    
    func testUpdatingDateUpdatesNsDate() {
        let now = DateTime.now
        let nowDate = now.nsDate
        let nowString = now.dateString
        
        now.date = FHIRDate(year: 2000, month: 01, day: 15)
        XCTAssertNotEqual(now.nsDate, nowDate)
        XCTAssertNotEqual(now.dateString, nowString)
    }
    
    func testUpdatingTimeUpdatesNSDate() {
        let now = DateTime.now
        let nowDate = now.nsDate
        let nowString = now.dateString
        
        now.time = FHIRTime(hour: 1, minute: 13, second: 25)
        XCTAssertNotEqual(now.nsDate, nowDate)
        XCTAssertNotEqual(now.dateString, nowString)
    }
    
    func testUpdatingNsDateUpdatesDateString() {
        let now = DateTime.now
        let nowString = now.dateString
        
        now.nsDate = Calendar.current.date(byAdding: .hour, value: -2, to: now.nsDate)!
        XCTAssertNotEqual(now.dateString, nowString)
    }
    
    func testCanRealmFilterOnValue() {
        let realm = makeRealm()
        
        let oldest = DateTime.now
        oldest.nsDate = Calendar.current.date(byAdding: .day, value: -3, to: oldest.nsDate)!
        
        let current = DateTime.now
        
        let newest = DateTime.now
        newest.nsDate = Calendar.current.date(byAdding: .day, value: 3, to: newest.nsDate)!
        
        
        try! realm.write {
            realm.add([oldest, current, newest])
        }
        
        let fetchedOldest = realm.objects(DateTime.self).filter("value < %@", current.nsDate)
        let fetchedCurrent = realm.objects(DateTime.self).filter("value = %@", current.nsDate)
        let fetchedNewest = realm.objects(DateTime.self).filter("value > %@", current.nsDate)
        
        XCTAssertEqual(fetchedOldest.count, 1)
        XCTAssertEqual(fetchedOldest.first?.nsDate, oldest.nsDate)
        
        XCTAssertEqual(fetchedCurrent.count, 1)
        XCTAssertEqual(fetchedCurrent.first?.nsDate, current.nsDate)
        
        XCTAssertEqual(fetchedNewest.count, 1)
        XCTAssertEqual(fetchedNewest.first?.nsDate, newest.nsDate)
    }
    
    func testPopulate() {
        let date = DateTime(string: "2015-03-28T05:11:44.3+01:00")!
        let other = DateTime(string: "2012-02-26T11:11:44.3-05:00")!
        date.populate(from: other)
        
        XCTAssertEqual(date.dateString, other.dateString)
        XCTAssertEqual(date.nsDate, other.nsDate)
        XCTAssertEqual(date.timeZone, other.timeZone)
        
        XCTAssertNotNil(date.date)
        XCTAssertNotNil(date.time)
        
        XCTAssertEqual(date.date!.year, other.date!.year)
        XCTAssertEqual(date.date!.month, other.date!.month)
        XCTAssertEqual(date.date!.day, other.date!.day)
        
        XCTAssertEqual(date.time!.hour, other.time!.hour)
        XCTAssertEqual(date.time!.minute, other.time!.minute)
        XCTAssertEqual(date.time!.second, other.time!.second)
        
        XCTAssertEqual(date.nsDate, other.nsDate)
    }
}


class InstantTests: XCTestCase, RealmPersistenceTesting {
	
	func testParseSuccess() {
		var d = Instant(string: "2015")
		XCTAssertTrue(nil == d)
		
		d = Instant(string: "2015-03")
		XCTAssertTrue(nil == d)
		
		d = Instant(string: "2015-03-28")
		XCTAssertTrue(nil == d)
		
		d = Instant(string: "2015-03-28T02:33")
		XCTAssertTrue(nil == d)
		
		d = Instant(string: "2015-03-28T02:33:29")
		XCTAssertTrue(nil == d)
		
		d = Instant(string: "2015-03-28T02:33:29+01:00")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date.year)
		XCTAssertEqual(Int8(3), d!.date.month!)
		XCTAssertEqual(Int8(28), d!.date.day!)
		XCTAssertEqual(Int8(2), d!.time.hour)
		XCTAssertEqual(Int8(33), d!.time.minute)
		XCTAssertEqual(29, d!.time.second)
		XCTAssertTrue(3600 == d!.timeZone.secondsFromGMT())
		
		d = Instant(string: "2015-03-28T02:33:29-05:00")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date.year)
		XCTAssertEqual(Int8(3), d!.date.month!)
		XCTAssertEqual(Int8(28), d!.date.day!)
		XCTAssertEqual(Int8(2), d!.time.hour)
		XCTAssertEqual(Int8(33), d!.time.minute)
		XCTAssertEqual(29, d!.time.second)
		XCTAssertTrue(-18000 == d!.timeZone.secondsFromGMT())
		
		d = Instant(string: "2015-03-28T02:33:29.1285-05:00")
		XCTAssertFalse(nil == d)
		XCTAssertEqual(2015, d!.date.year)
		XCTAssertEqual(Int8(3), d!.date.month!)
		XCTAssertEqual(Int8(28), d!.date.day!)
		XCTAssertEqual(Int8(2), d!.time.hour)
		XCTAssertEqual(Int8(33), d!.time.minute)
		XCTAssertEqual(29.1285, d!.time.second)
		XCTAssertTrue(-18000 == d!.timeZone.secondsFromGMT())
	}
	
	func testComparisons() {
		var a = Instant(string: "2015-03-28T03:11:04Z")!
		var b = Instant(string: "1915-03-28T03:11:04Z")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = Instant(string: "2015-03-28T03:11:04Z")!
		b = Instant(string: "2015-03-28T03:11:04+00:00")!
		XCTAssertFalse(a > b)
		XCTAssertTrue(a == b)
		XCTAssertTrue(a == a)
		
		a = Instant(string: "2015-03-28T03:11:44+00:00")!
		b = Instant(string: "2015-03-28T03:17:44+01:00")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = Instant(string: "2015-03-27T22:12:44-05:00")!
		b = Instant(string: "2015-03-28T03:11:44-00:00")!
		XCTAssertTrue(a > b)
		XCTAssertFalse(a == b)
		XCTAssertTrue(a == a)
		
		a = Instant(string: "2015-03-28T05:11:44.3+01:00")!
		b = Instant(string: "2015-03-27T23:11:44.3-05:00")!
		XCTAssertFalse(a > b)
		XCTAssertTrue(a == b)
		XCTAssertTrue(a == a)
	}
	
	func testConversion() {
		let inst = Instant(string: "1981-03-28T15:42:03-0500")!
		let ns = inst.nsDate
        XCTAssertTrue(inst == ns.fhir_asInstant(), "Conversion to NSDate and back again must not alter `Instant`")		
	}
	
	func testHttpDateParsing() {
		if let instant = Instant.fromHttpDate("Fri, 14 Aug 2009 14:45:31 GMT") {
			XCTAssertEqual(instant.date.year, 2009)
			XCTAssertEqual(instant.date.month, 8)
			XCTAssertEqual(instant.time.hour, 14)
			XCTAssertEqual(instant.time.minute, 45)
		}
		else {
			XCTAssertTrue(false, "Failed to parse perfectly fine HTTP date")
		}
		
		if let instant = Instant.fromHttpDate("Sun, 06 Nov 1994 08:49:37 GMT") {
			XCTAssertEqual(instant.date.year, 1994)
			XCTAssertEqual(instant.date.month, 11)
			XCTAssertEqual(instant.time.hour, 8)
			XCTAssertEqual(instant.time.minute, 49)
			XCTAssertEqual(instant.time.second, 37.0)
		}
		else {
			XCTAssertTrue(false, "Failed to parse perfectly fine HTTP date")
		}
		
		if let instant = Instant.fromHttpDate("Sunday, 06-Nov-94 08:49:37 GMT") {
			XCTAssertEqual(instant.date.year, 1994)
			XCTAssertEqual(instant.date.month, 11)
			XCTAssertEqual(instant.time.hour, 8)
			XCTAssertEqual(instant.time.minute, 49)
			XCTAssertEqual(instant.time.second, 37.0)
		}
		else {
			XCTAssertTrue(false, "Failed to parse perfectly fine HTTP date")
		}
		
		if let instant = Instant.fromHttpDate("Wed Nov 16 08:49:37 1994") {
			XCTAssertEqual(instant.date.year, 1994)
			XCTAssertEqual(instant.date.month, 11)
			XCTAssertEqual(instant.time.hour, 8)
			XCTAssertEqual(instant.time.minute, 49)
			XCTAssertEqual(instant.time.second, 37.0)
		}
		else {
			XCTAssertTrue(false, "Failed to parse perfectly fine HTTP date")
		}
	}
    
    func testCanRealmFilterOnValue() {
        let realm = makeRealm()
        
        let oldest = Instant.now
        oldest.nsDate = Calendar.current.date(byAdding: .day, value: -3, to: oldest.nsDate)!
        
        let current = Instant.now
        
        let newest = Instant.now
        newest.nsDate = Calendar.current.date(byAdding: .day, value: 3, to: newest.nsDate)!
        
        
        try! realm.write {
            realm.add([oldest, current, newest])
        }
        
        let fetchedOldest = realm.objects(Instant.self).filter("value < %@", current.nsDate)
        let fetchedCurrent = realm.objects(Instant.self).filter("value = %@", current.nsDate)
        let fetchedNewest = realm.objects(Instant.self).filter("value > %@", current.nsDate)
        
        XCTAssertEqual(fetchedOldest.count, 1)
        XCTAssertEqual(fetchedOldest.first?.nsDate, oldest.nsDate)
        
        XCTAssertEqual(fetchedCurrent.count, 1)
        XCTAssertEqual(fetchedCurrent.first?.nsDate, current.nsDate)
        
        XCTAssertEqual(fetchedNewest.count, 1)
        XCTAssertEqual(fetchedNewest.first?.nsDate, newest.nsDate)
    }
    
    func testPopulate() {
        let instant = Instant(string: "2015-03-28T05:11:44.3+01:00")!
        let other = Instant.now
        instant.populate(from: other)
        
        XCTAssertEqual(instant.dateString, other.dateString)
        XCTAssertEqual(instant.nsDate, other.nsDate)
        XCTAssertEqual(instant.timeZone, other.timeZone)
        
        XCTAssertNotNil(instant.date)
        XCTAssertNotNil(instant.time)
        
        XCTAssertEqual(instant.date.year, other.date.year)
        XCTAssertEqual(instant.date.month, other.date.month)
        XCTAssertEqual(instant.date.day, other.date.day)
        
        XCTAssertEqual(instant.time.hour, other.time.hour)
        XCTAssertEqual(instant.time.minute, other.time.minute)
        XCTAssertEqual(instant.time.second, other.time.second)
        
        XCTAssertEqual(instant.nsDate, other.nsDate)
    }
}
