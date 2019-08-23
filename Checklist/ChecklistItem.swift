//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Mauricio Barbosa on 22/08/19.
//  Copyright © 2019 Mauricio Barbosa. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var isChecked = false
    
    init(with text: String, _ isChecked: Bool = false) {
        self.text = text
        self.isChecked = isChecked
    }
}
