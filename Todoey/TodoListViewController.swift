//
//  ViewController.swift
//  Todoey
//
//  Created by George on 4/12/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import UIKit

class TodoListViewController : UITableViewController {
    
    var itemArray = [Item]()
    
    var item1 = Item()
     var item2 = Item()
     var item3 = Item()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        item1.title = "asd233"
        item2.title = "asd233"
        item3.title = "asd233"
        item1.done = true
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType  = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
    
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem = Item()
            
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            print(self.itemArray.count)
    
            self.tableView.reloadData()
            
        }
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
    }


}

