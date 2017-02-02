[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# RealmSwiftFHIR
RealmSwiftFHIR is an adaptation of [smart-on-fhir/Swift-FHIR](https://github.com/smart-on-fhir/Swift-FHIR/) which supports [Realm](https://realm.io) for data persistence. All FHIR `Resources` and `Elements` can be persisted to a Realm database via normal Realm means. Resource and Element `id` properties are the primary keys, and default to a UUID string. Checkout [the original Swift-FHIR project](https://github.com/smart-on-fhir/Swift-FHIR/) for more details on using the FHIR library itself.

The classes were generated by a forked verision of [smart-on-fhir/fhir-parser](https://github.com/smart-on-fhir/fhir-parser), which can be found at [ryanbaldwin/fhir-parser](https://github.com/ryanbaldwin/fhir-parser) (see the `realm-spike` branch). My current intention is to clean up this spike and submit a PR back to the original project, and then buy [Pascal Pfiffner](https://github.com/p2) a giant cake with a pinup girl inside.

### State of the Union
RealmSwiftFHIR is brand new and should be considered a Work In Progress. While initial testing appears to be working, and all unit tests pass, I've yet to actually use it in anything substantial. Use this at your own risk, and let me know if there are any gotchas. I'll build an enhancement/bug list as time goes by.

### Versioning
The current, and only version, of `RealmSmartFHIR` is `v0.2.0` and is based on the [FHIR DSTU2 spec](https://www.hl7.org/fhir/DSTU2/).

### Using RealmSwiftFHIR
This project currently supports Carthage, and I'll likely never support Cocoa-Pods because Cocoa-Pods, well, honestly, I hate Cocoa-Pods, it makes me cry and it doesn't care. It doesn't write home or check up on me or see how I'm doing. It just moves in and destroys my life. 

0. [Install Carthage](https://github.com/Carthage/Carthage), if you haven't already.
1. Add `github "ryanbaldwin/RealmSwiftFHIR" == 0.2.0` to your `Cartfile`
2. Do a quick `carthage update` and add the [framework to your project](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) as you normally would.
3. Build a kick ass application
4. Buy [Pascal Pfiffner](https://github.com/p2) a beer, because none of this is possible without his amazing work
