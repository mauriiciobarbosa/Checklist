//
//  ChecklistTableViewCell.swift
//  Checklist
//
//  Created by Mauricio Barbosa Santana on 12/09/19.
//  Copyright © 2019 Mauricio Barbosa. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    @IBOutlet weak var checkmarkLabel: UILabel!
    @IBOutlet weak var todoTestLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
