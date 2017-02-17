//
//  Money.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Money) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  An amount of money. With regard to precision, see [Decimal Precision](datatypes.html#precision).
 *
 *  There SHALL be a code if there is a value and it SHALL be an expression of currency.  If system is present, it SHALL
 *  be ISO 4217 (system = "urn:iso:std:iso:4217" - currency).
 */
open class Money: Quantity {
	override open class var resourceType: String {
		get { return "Money" }
	}



}

