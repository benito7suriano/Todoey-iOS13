//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    let defaults = UserDefaults.standard
    var itemArray = [
        "Eat soup",
        "Buy bananas",
        "Code Swift"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
    }
    
    //MARK:- UITableView Setup
    
    // Return the number of rows for the table.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    // Provide a cell object for each row.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
       // Configure the cell’s contents.
        cell.textLabel?.text = itemArray[indexPath.row]
        
       return cell
    }
    
    //MARK:- Check/Uncheck specific row
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print(itemArray[indexPath.row])
            
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK:- Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add a New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Create new item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!)
            
            // persist data in UserDefaults instance
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            print("Just added a new item")
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New item..."
            
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}
