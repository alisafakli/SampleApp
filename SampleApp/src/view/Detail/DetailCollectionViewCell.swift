//
//  DetailCollectionViewCell.swift
//  SampleApp
//
//  Created by Ali Safakli on 12/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    var cellData: PostModel!
    
    func configure(data: PostModel) {
        self.cellData = data
        self.titleLabel.text = data.title
        self.descLabel.text = data.body
        
    }
}
