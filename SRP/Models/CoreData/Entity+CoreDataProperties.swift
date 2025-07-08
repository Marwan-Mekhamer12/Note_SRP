//
//  Entity+CoreDataProperties.swift
//  SRP
//
//  Created by Marwan Mekhamer on 07/07/2025.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var title: String?
    @NSManaged public var done: Bool

}

extension Entity : Identifiable {

}
