[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# Table of Contents
- [Introduction](#realmswiftfhir)
- [Installation](#installation)
	- [Carthage](#carthage)
	- [Clone 'n Build](#clone-n-build)
- [Modifying RealmSwiftFHIR](#modifying-realmswiftfhir)

# RealmSwiftFHIR
RealmSwiftFHIR is an adaptation of [smart-on-fhir/Swift-FHIR](https://github.com/smart-on-fhir/Swift-FHIR/), with one notable difference: All FHIR Resources and Elements support [Realm](https://realm.io) for data persistence.

```Swift
import RealmSwiftFHIR


// You can hydrate a patient with some JSON from your FHIR Server and 
// natively save it to a Realm
let realm = Realm()
let patientResponseJSON = someMagicalFHIREndpoint(patientId: 123)
let patient = Patient(json: patientResponseJSON)
try! realm.write { realm.add(patient) }
 
// Alternatively you can Create your own patient
let sickMan = Patient()
sickMan.gender = "M"
sickMan.name.append(HumanName())
sickman.name[0].given.append(val: "Joey")
sickman.name[0].family.append(val: "Baloney")
try! realm.write { realm.add(sickMan) }

// You can update properties on your realm object as you normally would
 try! realm.write {
 	sickMan.name[0].given.value = "Joseph"
 	sickMan.name[0].family.value = "Balogna"
 }

// And of course, you can query for your Patient
let joeys = realm.objects(Patient.self).filter {
	$0.name.filter {
		$0.given.filter {
			$0.value == "Joseph"
		}.count > 0
	}.count > 0
}

// You can also fetch a patient by its ID (not guaranteed to be unique in RealmSwiftFHIR)
let lonelyJoey = realm.objects(Patient.self).filter("id = %@", "123").first // returns Patient?

// Or you can fetch a patient by it's RealmSwiftFHIR local primary key
let THEJoey = realm.object(ofType: Patient.self, forPrimaryKey: lonelyJoey?.pk)
```

Checkout [the original Swift-FHIR project](https://github.com/smart-on-fhir/Swift-FHIR/) for  details on the Swift-FHIR library itself.

# Installation
You have 2 options: 

1. [Carthage](https://github.com/Carthage/Carthage) (which will download the binaries attached to the appropriate Release)
2. Good ol' fashioned Clone 'n Build.

## Carthage
1. [Install Carthage](https://github.com/Carthage/Carthage), if you haven't already.
2. Add `github "ryanbaldwin/RealmSwiftFHIR" == 0.2.1` to the appropriate `Cartfile`
3. Do a quick `carthage update` and add the [framework to your project](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) as you normally would.
4. Build a kick ass health app and never worry about your datamodel again.

## Clone 'n Build
1. [Install Carthage](https://github.com/Carthage/Carthage), if you haven't already.
2. Clone this repo.
3. `cd` into the `realm-swift-fhir` project directory where the various `Cartfile`s reside.
4. run `./xcarthage bootstrap` to download the dependencies, both binary and external projects such as [Pascal Pfiffner](https://github.com/p2)'s `fhir-parser` (which does the actual parsing)
5. Open the `realm-swift-fhir.xcworkspace`
6. Build and run the tests as you would for any other Xcode project.

> **NOTE**: If you get a weird compilation error about unsupported ASCII while attempting to run the tests (roughly a dozen or so errors), switch your Xcode indentation settings to use tabs instead of spaces. I agree - this sucks. Sad face.

# Modifying RealmSwiftFHIR
All classes and tests in RealmSwiftFHIR are generated using [Pascal Pfiffner](https://github.com/p2)'s [smart-on-fhir/fhir-parser](https://github.com/smart-on-fhir/fhir-parser) and some old Swift3 templates he once had which I modified. Therefore, if you're interested in modifying the classes/tests, then it's best to modify the templates and re-generate the `*.swift` files.

The templates can be found in the `fhir-parser-resources/FHIR-1.6.0` directory. The main file's you'll be looking at modifying are:
 - `template-resource.swift`
 - `template-unittest.swift`

After making the changes you want (or didn't mean to make), you can re-generate _all_ the files by simply running the `./generate` script. This is an all or nothing Royal Rumble of code generation, and absolutely all `.swift` files will be overwritten. It is unapologetic in its aggressiveness. It cares not about your feelings. It is death, and it comes for your files.
> Learn more about [Pascal Pfiffner](https://github.com/p2)'s [smart-on-fhir/fhir-parser](https://github.com/smart-on-fhir/fhir-parser) by visiting its repo.

## Primary Keys
All FHIR `Resources` and `Elements` can be persisted to a Realm database via normal Realm means (`realm.add`, `realm.delete`, etc). Resource and Element `pk` properties are the primary keys, and default to a UUID string if instantiated normally (eg. `let p = Patient()`). ~~The exception is when inflating from JSON. In this scenario the `pk` will default to the value contained in the `id` field, if one exists; otherwise it will revert to its default~~ (no longer the case as of v0.2.1).

## Generated by [Pascal Pfiffner](https://github.com/p2)'s Giant Brain
The classes were generated by a forked verision of [smart-on-fhir/fhir-parser](https://github.com/smart-on-fhir/fhir-parser), which can be found at [ryanbaldwin/fhir-parser](https://github.com/ryanbaldwin/fhir-parser). This project will soon be closing and moved into this project proper, as Pascal has removed language packs from the `fhir-parser` project (can't say I blame him...). 

Give credit where credit is due, this wouldn't exist without [Pascal Pfiffner](https://github.com/p2), so buy him a giant cake with a pinup girl inside.

### State of the Union
RealmSwiftFHIR is brand new and should be considered a Work In Progress. While initial testing appears to be working, and all unit tests pass, I've yet to actually use it in anything substantial. Use this at your own risk, and let me know if there are any gotchas. I'll build an enhancement/bug list as time goes by.

### Versioning
Current of `RealmSmartFHIR` is `v0.2.1` and is based on the [FHIR DSTU2 spec](https://www.hl7.org/fhir/DSTU2/).

### Using RealmSwiftFHIR
This project currently supports Carthage, and I'll likely never support Cocoa-Pods because Cocoa-Pods, well, honestly, I hate Cocoa-Pods, it makes me cry and it doesn't care. It doesn't write home or check up on me or see how I'm doing. It just moves in and destroys my life. 
