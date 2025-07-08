//
//  CoreDataHelper.swift
//  SRP
//
//  Created by Marwan Mekhamer on 07/07/2025.
//

import Foundation
import CoreData
import UIKit

class CLASSCoreData {
    
    let Context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // to get all of items in row
    func getAllItems() -> [Entity] {
        do {
            let item = try Context.fetch(Entity.fetchRequest())
            return item
        } catch {
            print("❌ Failed to fetch: \(error)")
            return []
        }
    }
     // to Create a new item
    func CreateItems(title: String) {
        let newitems = Entity(context: Context)
        newitems.title = title
        do {
            try Context.save()
        } catch {
            
        }
    }
    
    // to Delete item from row
    func DeleteItem(item: Entity) {
        Context.delete(item)
        do {
            try Context.save()
        } catch {
            
        }
    }
    
    // to update items in row
    func UpdateItem(item: Entity, newtitle: String) {
        item.title = newtitle
        do {
            try Context.save()
        } catch {
            
        }
    }
}
