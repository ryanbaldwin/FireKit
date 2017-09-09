//
//  FHIRAbstractResource.swift
//  SwiftFHIR
//
//  Created by Pascal Pfiffner on 7/2/14.
//  2014, SMART Health IT.
//

import Foundation


/**
 *  Abstract superclass for all FHIR resource models.
 */
open class FHIRAbstractResource: FHIRAbstractBase {
    private enum CodingKeys: String, CodingKey {
        case resourceType
    }
	
    /// A specific version id, if the instance was created using `vread`.
	open var _versionId: String?
	override open var description: String {
		return "<\(type(of: self).resourceType)>"
	}
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type(of: self).resourceType, forKey: .resourceType)
    }
}
