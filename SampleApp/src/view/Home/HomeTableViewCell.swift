//
//  HomeTableViewCell.swift
//  SampleApp
//
//  Created by Ali Safakli on 12/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var cellData: UserModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(data: UserModel) {
        self.cellData = data
        self.nameLabel.text = cellData.name
        self.usernameLabel.text = cellData.username
    }

}
