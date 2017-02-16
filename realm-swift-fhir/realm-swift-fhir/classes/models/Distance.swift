//
//  Distance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Distance) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A measure of distance.
 *
 *  There SHALL be a code if there is a value and it SHALL be an expression of length.  If system is present, it SHALL
 *  be UCUM.
 */
open class Distance: Quantity {
	override open class var resourceType: String {
		get { return "Distance" }
	}



}

