//
//  FarmListCell.swift
//  agFarm
//
//  Created by shashikant kadgi on 16/09/19.
//  Copyright © 2019 shashikant kadgi. All rights reserved.
//

import UIKit

class FarmListCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCultivationYear: UILabel!
    @IBOutlet weak var lblseason: UILabel!
    @IBOutlet weak var lblFarmCode: UILabel!
    @IBOutlet weak var lblAddressLine1: UILabel!
    @IBOutlet weak var lblAddressLine2: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblCounty: UILabel!
    @IBOutlet weak var lblVillage: UILabel!
    @IBOutlet weak var lblZipcode: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
