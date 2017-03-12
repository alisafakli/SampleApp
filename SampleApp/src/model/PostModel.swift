//
//  PostModel.swift
//  SampleApp
//
//  Created by Ali Safakli on 12/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit
import SwiftyJSON

class PostModel: NSObject {
    var userId: Int!
    var id: Int!
    var title: String!
    var body: String!
    
    required init(json: JSON) {
        userId = json["userId"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        body = json["body"].stringValue
    }

}
