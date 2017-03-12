//
//  ViewController.swift
//  SampleApp
//
//  Created by Ali Safakli on 10/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var homeView: HomeView!
    var userModelArray: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveBackground(vw: self.backgroundImageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getUsers()
    }
    
    func getUsers() {
        RestApiManager.shared.getUsers(onCompletion: { userModelArray in
            DispatchQueue.main.async(){
                self.userModelArray = userModelArray
                self.tableView.reloadData()
            }

        })
    }
    
    //Move background image with screen motion
    func moveBackground(vw: UIView) {
        let movement = 300
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -movement
        horizontal.maximumRelativeValue = movement
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -movement
        vertical.maximumRelativeValue = movement
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }
    
    //Tableview data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userModelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "user_cell", for: indexPath) as? HomeTableViewCell {
            cell.configure(data: userModelArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

