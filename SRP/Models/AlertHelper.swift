//
//  AddTextField.swift
//  SRP
//
//  Created by Marwan Mekhamer on 07/07/2025.
//

import Foundation
import UIKit

class AlertHelper{
    
    
     func createAddAlert(_ Completion: @escaping (String) -> Void) -> UIAlertController {
        
        let alert = UIAlertController(title: "Add...", message: "You can add what you want.", preferredStyle: .alert)
        
        alert.addTextField { textfield in
            textfield.placeholder = "Write to me someThing 😋"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {  _ in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                Completion(text)
            }
        }))
        
        return alert
        
    }
   
}

