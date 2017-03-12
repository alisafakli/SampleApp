//
//  UserModel.swift
//  SampleApp
//
//  Created by Ali Safakli on 12/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserModel {
    var id: Int!
    var name: String!
    var username: String!
    var email: String!
    var address: AddressModel!
    var phone: String!
    var website: String!
    var company: CompanyModel!
    
    required init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        username = json["username"].stringValue
        email = json["email"].stringValue
        address = AddressModel(json: json["address"])
        phone = json["phone"].stringValue
        website = json["website"].stringValue
        company = CompanyModel(json: json["company"])
    }
}

class CompanyModel {
    var name: String!
    var catchPhrase: String!
    var bs: String!
    
    required init(json: JSON) {
        name = json["name"].stringValue
        catchPhrase = json["catchPhrase"].stringValue
        bs = json["bs"].stringValue
    }

}

class AddressModel {
    var street: String!
    var suite: String!
    var city: String!
    var zipcode: String!
    var geo: GeoModel!
    
    required init(json: JSON) {
        street = json["street"].stringValue
        suite = json["suite"].stringValue
        city = json["city"].stringValue
        zipcode = json["zipcode"].stringValue
        geo = GeoModel(json: json["geo"])
    }
    

}

class GeoModel {
    var lat: String!
    var lng: String!
    required init(json: JSON) {
        lat = json["lat"].stringValue
        lng = json["lng"].stringValue
    }

}
