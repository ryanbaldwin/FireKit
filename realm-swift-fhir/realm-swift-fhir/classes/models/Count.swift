//
//  Count.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Count) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A count of a discrete element (no unit).
 *
 *  There SHALL be a code with a value of "1" if there is a value and it SHALL be an expression of length.  If system is
 *  present, it SHALL be UCUM.  If present, the value SHALL a whole number.
 */
open class Count: Quantity {
	override open class var resourceType: String {
		get { return "Count" }
	}



}

