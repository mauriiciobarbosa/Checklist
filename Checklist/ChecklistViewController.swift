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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.size
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let checklistItem = todoList.getItem(at: indexPath.row)
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = checklistItem.text
        }
        
        if let checkmark = cell.viewWithTag(1001) as? UILabel {
            checkmark.isHidden = !checklistItem.isChecked
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let checklistItem = todoList.getItem(at: indexPath.row)
            
            if let checkmark = cell.viewWithTag(1001) as? UILabel {
                checkmark.isHidden = checklistItem.isChecked
                checklistItem.toggleChecked()
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.removeItem(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? AddNewItemTableViewController {
            viewController.delegate = self
            
            if segue.identifier == "EditItemSegue",
                let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) {
                viewController.editItem = todoList.getItem(at: indexPath.row)
            }
        }
    }
}

extension ChecklistViewController: AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddNewItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddNewItemTableViewController, didFinishAdding item: ChecklistItem) {
        todoList.add(item: item)
        let indexPath = IndexPath(row: todoList.size - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
        navigationController?.popViewController(animated: true)
    }
    
    func addItemViewController(_ controller: AddNewItemTableViewController, didFinishEditing item: ChecklistItem) {
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
