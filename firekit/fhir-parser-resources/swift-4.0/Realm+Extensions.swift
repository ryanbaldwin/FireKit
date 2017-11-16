//
//  Realm+Extensions.swift
//  FireKit-iOS
//
//  Created by Ryan Baldwin on 2017-10-05.
//  Copyright © 2017 Bunnyhug. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {
    public func resource<T: Resource>(_ ofType: T.Type, withId id: String) -> T? {
        return objects(ofType).filter("id = %@", id).first
    }
    
    public func resources<T: Resource>(_ ofType: T.Type, withIds ids: [String]) -> Results<T> {
        return objects(ofType).filter(NSPredicate(format: "id IN %@", Set(ids)))
    }
    
    /// Performs an intelligent update-or-insert action based on the `id` field of the provided resource.
    ///
    /// - Parameter resource: The resource to be updated or inserted.
    /// - Warning: This method may only be called during a write transaction
    /// - Returns: The passed Resource, if it did not already exist; otherwise the pre-existing Updated resource.
    @discardableResult public func upsert<T>(_ resource: T) -> T where T: Resource {
        guard let resourceId = resource.id else {
            let message = "Cannot upsert this Resource because it did not contain an ID. " +
            "Will insert Resource (\(T.self)) with key\(resource.pk))"
            print(message)
            add(resource)
            return resource
        }
        
        if let existing = self.resource(T.self, withId: resourceId) {
            existing.populate(from: resource)
            return existing
        }
        
        add(resource)
        return resource
    }
    
    /// Performs an intelligent update-or-insert action based on the `id` field of a Resource.
    ///
    /// - Parameter resources: The resourses to be updated or inserted.
    /// - Warning: This method may only be called during a write transaction
    /// - Returns: The list of new and now-up-to-date-existing resources, in the same order.
    @discardableResult public func upsert<T>(_ resources: [T]) -> [T] where T: Resource {
        guard resources.count > 0 else {
            return resources
        }
        
        // First, we want to build up a map of `id` to Resource, for quick retrieval & replacement.
        var resourcesMap: [String: T] = [:]
        resources.lazy.filter { resource in resource.id != nil }
            .forEach { resource in resourcesMap[resource.id!] = resource }
        let resourcesToAdd = resources.lazy.filter { resource in resource.id == nil }
        
        // Next, get all the local T where each respective's `id` matches on from the map
        let resourceIds = Set(resourcesMap.keys)
        
        // lame string concatenation here because there's no good shorthand
        // to get a set in the proper realm query format.
        let existingResources = objects(T.self).filter(NSPredicate(format: "id IN %@", resourceIds))
        
        // For any T that exists locally, we simply want to re-populate it from what's passed in.
        // This is where that nice map above comes in handy.
        // We will then replace what's in the map with what's been replaced in the DB, which
        // will help us guarantee the order of the passed in resources array.
        existingResources.forEach { existing in
            if let existingId = existing.id, let resource = resourcesMap[existingId] {
                existing.populate(from: resource)
                resourcesMap[existingId] = existing
            }
        }
        
        // Add any T that doesn't exist locally.
        let existingIds = Set(existingResources.flatMap() { resource in return resource.id })
        let remainingResources = resourceIds.symmetricDifference(existingIds).flatMap { resourceId in
            resourcesMap[resourceId]
        }
        
        self.add(resourcesToAdd + remainingResources)
        return resources.map { resourcesMap[$0.id ?? "not-found"] ?? $0 }
    }
}
