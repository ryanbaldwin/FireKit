//
//  OrganizationTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class OrganizationTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Organization {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Organization {
		let instance = RealmSwiftFHIR.Organization(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testOrganization1() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization1()
			try runOrganization1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm1(instance: instance!)
	}

	func testOrganizationRealm1(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization1(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-f001-burgers.json")
		
		XCTAssertEqual(inst.address[0].city, "Den Burg")
		XCTAssertEqual(inst.address[0].country, "NLD")
		XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
		XCTAssertEqual(inst.address[0].postalCode, "9105 PZ")
		XCTAssertEqual(inst.address[0].use, "work")
		XCTAssertEqual(inst.address[1].city, "Den Burg")
		XCTAssertEqual(inst.address[1].country, "NLD")
		XCTAssertEqual(inst.address[1].line[0].value, "PO Box 2311")
		XCTAssertEqual(inst.address[1].postalCode, "9100 AA")
		XCTAssertEqual(inst.address[1].use, "work")
		XCTAssertEqual(inst.contact[0].purpose?.coding[0].code, "PRESS")
		XCTAssertEqual(inst.contact[0].purpose?.coding[0].system, "http://hl7.org/fhir/contactentity-type")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "022-655 2334")
		XCTAssertEqual(inst.contact[1].purpose?.coding[0].code, "PATINF")
		XCTAssertEqual(inst.contact[1].purpose?.coding[0].system, "http://hl7.org/fhir/contactentity-type")
		XCTAssertEqual(inst.contact[1].telecom[0].system, "phone")
		XCTAssertEqual(inst.contact[1].telecom[0].value, "022-655 2335")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "91654")
		XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.1")
		XCTAssertEqual(inst.identifier[1].use, "usual")
		XCTAssertEqual(inst.identifier[1].value, "17-0112278")
		XCTAssertEqual(inst.name, "Burgers University Medical Center")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "work")
		XCTAssertEqual(inst.telecom[0].value, "022-655 2300")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "V6")
		XCTAssertEqual(inst.type?.coding[0].display, "University Medical Hospital")
		XCTAssertEqual(inst.type?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.1060")
		XCTAssertEqual(inst.type?.coding[1].code, "prov")
		XCTAssertEqual(inst.type?.coding[1].display, "Healthcare Provider")
		XCTAssertEqual(inst.type?.coding[1].system, "http://hl7.org/fhir/organization-type")
		
		return inst
	}
	
	func testOrganization2() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization2()
			try runOrganization2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm2(instance: instance!)
	}

	func testOrganizationRealm2(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization2(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-f002-burgers-card.json")
		
		XCTAssertTrue(inst.active.value ?? false)
		XCTAssertEqual(inst.address[0].line[0].value, "South Wing, floor 2")
		XCTAssertEqual(inst.contact[0].address?.line[0].value, "South Wing, floor 2")
		XCTAssertEqual(inst.contact[0].name?.text, "mevr. D. de Haan")
		XCTAssertEqual(inst.contact[0].purpose?.coding[0].code, "ADMIN")
		XCTAssertEqual(inst.contact[0].purpose?.coding[0].system, "http://hl7.org/fhir/contactentity-type")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "022-655 2321")
		XCTAssertEqual(inst.contact[0].telecom[1].system, "email")
		XCTAssertEqual(inst.contact[0].telecom[1].value, "cardio@burgersumc.nl")
		XCTAssertEqual(inst.contact[0].telecom[2].system, "fax")
		XCTAssertEqual(inst.contact[0].telecom[2].value, "022-655 2322")
		XCTAssertEqual(inst.id, "f002")
		XCTAssertEqual(inst.name, "Burgers UMC Cardiology unit")
		XCTAssertEqual(inst.partOf?.reference, "Organization/f001")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].value, "022-655 2320")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "dept")
		XCTAssertEqual(inst.type?.coding[0].display, "Hospital Department")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/organization-type")
		
		return inst
	}
	
	func testOrganization3() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization3()
			try runOrganization3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm3(instance: instance!)
	}

	func testOrganizationRealm3(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization3(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-f003-burgers-ENT.json")
		
		XCTAssertTrue(inst.active.value ?? false)
		XCTAssertEqual(inst.address[0].line[0].value, "West Wing, floor 5")
		XCTAssertEqual(inst.contact[0].address?.line[0].value, "West Wing, floor 5")
		XCTAssertEqual(inst.contact[0].name?.text, "mr. F. de Hond")
		XCTAssertEqual(inst.contact[0].purpose?.coding[0].code, "ADMIN")
		XCTAssertEqual(inst.contact[0].purpose?.coding[0].system, "http://hl7.org/fhir/contactentity-type")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "022-655 7654")
		XCTAssertEqual(inst.contact[0].telecom[1].system, "email")
		XCTAssertEqual(inst.contact[0].telecom[1].value, "KNO@burgersumc.nl")
		XCTAssertEqual(inst.contact[0].telecom[2].system, "fax")
		XCTAssertEqual(inst.contact[0].telecom[2].value, "022-655 0998")
		XCTAssertEqual(inst.id, "f003")
		XCTAssertEqual(inst.name, "Burgers UMC Ear,Nose,Throat unit")
		XCTAssertEqual(inst.partOf?.reference, "Organization/f001")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].value, "022-655 6780")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "dept")
		XCTAssertEqual(inst.type?.coding[0].display, "Hospital Department")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/organization-type")
		
		return inst
	}
	
	func testOrganization4() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization4()
			try runOrganization4(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm4(instance: instance!)
	}

	func testOrganizationRealm4(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization4(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-f201-aumc.json")
		
		XCTAssertTrue(inst.active.value ?? false)
		XCTAssertEqual(inst.address[0].city, "Den Helder")
		XCTAssertEqual(inst.address[0].country, "NLD")
		XCTAssertEqual(inst.address[0].line[0].value, "Walvisbaai 3")
		XCTAssertEqual(inst.address[0].postalCode, "2333ZA")
		XCTAssertEqual(inst.address[0].use, "work")
		XCTAssertEqual(inst.contact[0].address?.city, "Den helder")
		XCTAssertEqual(inst.contact[0].address?.country, "NLD")
		XCTAssertEqual(inst.contact[0].address?.line[0].value, "Walvisbaai 3")
		XCTAssertEqual(inst.contact[0].address?.line[1].value, "Gebouw 2")
		XCTAssertEqual(inst.contact[0].address?.postalCode, "2333ZA")
		XCTAssertEqual(inst.contact[0].name?.family[0].value, "Brand")
		XCTAssertEqual(inst.contact[0].name?.given[0].value, "Ronald")
		XCTAssertEqual(inst.contact[0].name?.prefix[0].value, "Prof.Dr.")
		XCTAssertEqual(inst.contact[0].name?.text, "Professor Brand")
		XCTAssertEqual(inst.contact[0].name?.use, "official")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
		XCTAssertEqual(inst.contact[0].telecom[0].use, "work")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "+31715269702")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.identifier[0].system, "http://www.zorgkaartnederland.nl/")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "Artis University Medical Center")
		XCTAssertEqual(inst.name, "Artis University Medical Center (AUMC)")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "work")
		XCTAssertEqual(inst.telecom[0].value, "+31715269111")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "405608006")
		XCTAssertEqual(inst.type?.coding[0].display, "Academic Medical Center")
		XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.type?.coding[1].code, "V6")
		XCTAssertEqual(inst.type?.coding[1].display, "University Medical Hospital")
		XCTAssertEqual(inst.type?.coding[1].system, "urn:oid:2.16.840.1.113883.2.4.15.1060")
		XCTAssertEqual(inst.type?.coding[2].code, "prov")
		XCTAssertEqual(inst.type?.coding[2].display, "Healthcare Provider")
		XCTAssertEqual(inst.type?.coding[2].system, "http://hl7.org/fhir/organization-type")
		
		return inst
	}
	
	func testOrganization5() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization5()
			try runOrganization5(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm5(instance: instance!)
	}

	func testOrganizationRealm5(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization5(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-f203-bumc.json")
		
		XCTAssertTrue(inst.active.value ?? false)
		XCTAssertEqual(inst.address[0].city, "Blijdorp")
		XCTAssertEqual(inst.address[0].country, "NLD")
		XCTAssertEqual(inst.address[0].line[0].value, "apenrots 230")
		XCTAssertEqual(inst.address[0].postalCode, "3056BE")
		XCTAssertEqual(inst.address[0].use, "work")
		XCTAssertEqual(inst.id, "f203")
		XCTAssertEqual(inst.identifier[0].system, "http://www.zorgkaartnederland.nl/")
		XCTAssertEqual(inst.identifier[0].type?.text, "Zorginstelling naam")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "Blijdorp MC")
		XCTAssertEqual(inst.name, "Blijdorp Medisch Centrum (BUMC)")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "work")
		XCTAssertEqual(inst.telecom[0].value, "+31107040704")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "405608006")
		XCTAssertEqual(inst.type?.coding[0].display, "Academic Medical Center")
		XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.type?.coding[1].code, "prov")
		XCTAssertEqual(inst.type?.coding[1].system, "http://hl7.org/fhir/organization-type")
		
		return inst
	}
	
	func testOrganization6() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization6()
			try runOrganization6(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm6(instance: instance!)
	}

	func testOrganizationRealm6(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization6(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-gastro.json")
		
		XCTAssertEqual(inst.id, "1")
		XCTAssertEqual(inst.identifier[0].system, "http://www.acme.org.au/units")
		XCTAssertEqual(inst.identifier[0].value, "Gastro")
		XCTAssertEqual(inst.name, "Gastroenterology")
		XCTAssertEqual(inst.partOf?.display, "ACME Healthcare, Inc")
		XCTAssertEqual(inst.partOf?.reference, "Organization/1")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "mobile")
		XCTAssertEqual(inst.telecom[0].value, "+1 555 234 3523")
		XCTAssertEqual(inst.telecom[1].system, "email")
		XCTAssertEqual(inst.telecom[1].use, "work")
		XCTAssertEqual(inst.telecom[1].value, "gastro@acme.org")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Gastroenterology @ Acme Hospital. ph: +1 555 234 3523, email: \n        <a href=\"mailto:gastro@acme.org\">gastro@acme.org</a>\n      </p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testOrganization7() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization7()
			try runOrganization7(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm7(instance: instance!)
	}

	func testOrganizationRealm7(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization7(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization7(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-good-health-care.json")
		
		XCTAssertEqual(inst.id, "2.16.840.1.113883.19.5")
		XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[0].value, "2.16.840.1.113883.19.5")
		XCTAssertEqual(inst.name, "Good Health Clinic")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Good Health Clinic</p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testOrganization8() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization8()
			try runOrganization8(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm8(instance: instance!)
	}

	func testOrganizationRealm8(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization8(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization8(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-insurer.json")
		
		XCTAssertEqual(inst.id, "2")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.840.1.113883.3.19.2.3")
		XCTAssertEqual(inst.identifier[0].value, "666666")
		XCTAssertEqual(inst.name, "XYZ Insurance")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>XYZ Insurance</p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testOrganization9() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization9()
			try runOrganization9(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm9(instance: instance!)
	}

	func testOrganizationRealm9(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization9(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization9(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example-lab.json")
		
		XCTAssertEqual(inst.id, "1832473e-2fe0-452d-abe9-3cdb9879522f")
		XCTAssertEqual(inst.identifier[0].system, "http://www.acme.org.au/units")
		XCTAssertEqual(inst.identifier[0].value, "ClinLab")
		XCTAssertEqual(inst.name, "Clinical Lab")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "work")
		XCTAssertEqual(inst.telecom[0].value, "+1 555 234 1234")
		XCTAssertEqual(inst.telecom[1].system, "email")
		XCTAssertEqual(inst.telecom[1].use, "work")
		XCTAssertEqual(inst.telecom[1].value, "contact@labs.acme.org")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Clinical Laboratory @ Acme Hospital. ph: +1 555 234 1234, email: \n        <a href=\"mailto:contact@labs.acme.org\">contact@labs.acme.org</a>\n      </p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testOrganization10() {		
		var instance: RealmSwiftFHIR.Organization?
		do {
			instance = try runOrganization10()
			try runOrganization10(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Organization successfully, but threw")
		}

		testOrganizationRealm10(instance: instance!)
	}

	func testOrganizationRealm10(instance: RealmSwiftFHIR.Organization) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrganization10(realm.objects(RealmSwiftFHIR.Organization.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Organization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Organization.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrganization10(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Organization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "organization-example.json")
		
		XCTAssertEqual(inst.address[0].city, "Ann Arbor")
		XCTAssertEqual(inst.address[0].country, "USA")
		XCTAssertEqual(inst.address[0].line[0].value, "3300 Washtenaw Avenue, Suite 227")
		XCTAssertEqual(inst.address[0].postalCode, "48104")
		XCTAssertEqual(inst.address[0].state, "MI")
		XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/organization-alias")
		XCTAssertEqual(inst.extension_fhir[0].valueString, "HL7 International")
		XCTAssertEqual(inst.id, "hl7")
		XCTAssertEqual(inst.name, "Health Level Seven International")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].value, "(+1) 734-677-7777")
		XCTAssertEqual(inst.telecom[1].system, "fax")
		XCTAssertEqual(inst.telecom[1].value, "(+1) 734-677-6622")
		XCTAssertEqual(inst.telecom[2].system, "email")
		XCTAssertEqual(inst.telecom[2].value, "hq@HL7.org")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
