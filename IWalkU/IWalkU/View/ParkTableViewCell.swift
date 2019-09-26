//
//  ParkTableViewCell.swift
//  IWalkU
//
//  Created by joon-ho kil on 9/26/19.
//  Copyright © 2019 DandD. All rights reserved.
//

import UIKit

class ParkTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func putInfo(parkInfo: SeoulMainParkElement) {
        self.titleLabel.text = parkInfo.pPark
    }

}
