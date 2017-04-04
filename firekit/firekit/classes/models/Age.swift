//
//  Age.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Age) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A duration (length of time) with a UCUM code.
 *
 *  There SHALL be a code if there is a value and it SHALL be an expression of time.  If system is present, it SHALL be
 *  UCUM.  If value is present, it SHALL be positive.
 */
open class Age: Quantity {
	override open class var resourceType: String {
		get { return "Age" }
	}



}

