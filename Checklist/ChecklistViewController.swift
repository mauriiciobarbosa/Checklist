//
//  ViewController.swift
//  Checklist
//
//  Created by Mauricio Barbosa on 17/08/19.
//  Copyright © 2019 Mauricio Barbosa. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var todoList: TodoList
    
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        _ = todoList.newItem()
        let indexPath = IndexPath(row: todoList.size - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.size
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let checklistItem = todoList.getItem(at: indexPath.row)
        cell.accessoryType = checklistItem.isChecked ? .checkmark : .none
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = checklistItem.text
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let checklistItem = todoList.getItem(at: indexPath.row)
            cell.accessoryType = checklistItem.isChecked ? .none : .checkmark
            checklistItem.toggleChecked()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.removeItem(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }

}

