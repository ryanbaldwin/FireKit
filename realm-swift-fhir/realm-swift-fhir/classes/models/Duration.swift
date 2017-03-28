//
//  Duration.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Duration) on 2017-03-28.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A length of time.
 *
 *  There SHALL be a code if there is a value and it SHALL be an expression of time.  If system is present, it SHALL be
 *  UCUM.
 */
open class Duration: Quantity {
	override open class var resourceType: String {
		get { return "Duration" }
	}



}

