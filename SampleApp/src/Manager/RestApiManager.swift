//
//  RestApiManager.swift
//  SampleApp
//
//  Created by Ali Safakli on 10/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import Foundation
import SwiftyJSON

enum RequestURL: String {
    case users = "users"
    case posts = "posts"
}

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager: NSObject {
    static let shared = RestApiManager()
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getUsers(onCompletion: @escaping ([UserModel]) -> Void) {
        Utilities.shared.lockScreen()
        makeHTTPGetRequest(path: baseURL + RequestURL.users.rawValue, onCompletion: { json, error in
            Utilities.shared.unlockScreen()
            var userModelArray:[UserModel] = []
            for (_,object) in json {
                userModelArray.append(UserModel(json: object))
            }
            onCompletion(userModelArray)
        })
    }
    
    func getPostsBy(userId: Int, onCompletion: @escaping ([PostModel]) -> Void) {
        Utilities.shared.lockScreen()
        makeHTTPGetRequest(path: baseURL + RequestURL.posts.rawValue + "?userId=\(userId)", onCompletion: { json, error in
            Utilities.shared.unlockScreen()
            var postModelArray:[PostModel] = []
            for (_,object) in json {
                postModelArray.append(PostModel(json: object))
            }
            onCompletion(postModelArray)
        })
    }
    
    
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        if let url = NSURL(string: path) as? URL {
            let request = NSMutableURLRequest(url: url)
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
                guard error == nil else {
                    Utilities.shared.alert(message: "\(error)", title: "ERROR!")
                    return
                }
                
                guard let data = data else {
                    return
                }
                let json: JSON = JSON(data)
                onCompletion(json, error as NSError?)
            }
            task.resume()
        }
    }
    
    
}
