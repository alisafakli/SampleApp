//
//  RestApiManager.swift
//  SampleApp
//
//  Created by Ali Safakli on 10/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    static let shared = RestApiManager()
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
}
