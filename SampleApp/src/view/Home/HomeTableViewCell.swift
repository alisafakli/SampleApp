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
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var emailLabel: UILabel!
    var cellData: UserModel!
    
    func configure(data: UserModel) {
        self.cellData = data
        self.nameLabel.text = cellData.name
        self.usernameLabel.text = cellData.username
        self.emailLabel.text = cellData.email
        self.addressTextView.attributedText = addressAttributedText(data: self.cellData.address)
    }
    
    func addressAttributedText(data: AddressModel) -> NSAttributedString {
        
        let string = "Street: \(data.street!)\nSuite: \(data.suite!)\nCity: \(data.city!)\nZip Code:\(data.zipcode!)" as NSString
        
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 13.0)])
        
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 13.0)]
        
        // Bold part
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Street:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Suite:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "City:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Zip Code:"))

        return attributedString
        
    }
}
