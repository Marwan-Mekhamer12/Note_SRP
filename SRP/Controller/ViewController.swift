//
//  ViewController.swift
//  SRP
//
//  Created by Marwan Mekhamer on 06/07/2025.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrData = [Entity]()
    let alertHelper = AlertHelper()
    let coredata = CLASSCoreData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        taBBar()
        arrData = coredata.getAllItems()
    }
    
    func taBBar() {
        let bar = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addmore))
        navigationItem.rightBarButtonItem = bar
    }
    
    @objc func addmore() {
        
        let alert = alertHelper.createAddAlert { [weak self] text in
            if let self = self {
                self.coredata.CreateItems(title: text)
                self.arrData = self.coredata.getAllItems()
                self.tableView.reloadData()
            }
            
        }
        
        present(alert, animated: true)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let items = arrData[indexPath.row]
        cell.textLabel?.text = items.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let items = arrData[indexPath.row]
        print(items.title ?? "")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "") { [weak self] code, _, _ in
            if let self = self {
                let itemToDelete = self.arrData[indexPath.row]
                self.coredata.DeleteItem(item: itemToDelete)
                self.arrData = self.coredata.getAllItems()
                self.tableView.reloadData()
            }
        }
        
        delete.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
