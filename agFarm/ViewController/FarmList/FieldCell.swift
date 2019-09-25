//
//  FieldCell.swift
//  agFarm
//
//  Created by shashikant kadgi on 18/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

protocol ExpandCellDelegate: class {
    func updateTableView(row: Int)
    
}

class FieldCell: UITableViewCell {

    
    @IBOutlet weak var btnExpand: UIButton!
    weak var delegate: ExpandCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func expandCell(_ sender: UIButton) {
        
     //   print("First View: \(sender.tag)")
        delegate?.updateTableView(row: sender.tag)
    }
}
