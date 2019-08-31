//
//  AddNewItemTableViewController.swift
//  Checklist
//
//  Created by Mauricio Barbosa on 31/08/19.
//  Copyright © 2019 Mauricio Barbosa. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController {
    
    weak var delegate: ItemDetailViewControllerDelegate?
    weak var editItem: ChecklistItem?
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let title = textField.text {
            
            if let item = editItem {
                item.text = title
                delegate?.itemDetailViewController(self, didFinishEditing: item)
            } else {
                let newItem = ChecklistItem(with: title)
                delegate?.itemDetailViewController(self, didFinishAdding: newItem)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = editItem {
            textField.text = item.text
            title = "Edit item"
            addBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }

}

extension ItemDetailViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        addBarButton.isEnabled = string.count > 0 || range.length < textField.text?.count ?? 0
        return true
    }
}
