//
//  ViewController.swift
//  Checklist
//
//  Created by Mauricio Barbosa on 17/08/19.
//  Copyright © 2019 Mauricio Barbosa. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items: [ChecklistItem] = []
    let size = 1000
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for index in 0..<size {
            let label = self.getLabel(index % 5)
            items.append(ChecklistItem(with: label, true))
        }
    }
    
    private func getLabel(_ index: Int) -> String {
        switch index {
        case 0:
            return "Take a jog"
        case 1:
            return "Watch a movie"
        case 2:
            return "Code an app"
        case 3:
            return "Walk the dog"
        default:
            return "Study design patterns"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return size
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let checklistItem = items[indexPath.row]
        cell.accessoryType = checklistItem.isChecked ? .checkmark : .none
        
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = checklistItem.text
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let checklistItem = items[indexPath.row]
            cell.accessoryType = checklistItem.isChecked ? .none : .checkmark
            checklistItem.isChecked = !checklistItem.isChecked
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

}

