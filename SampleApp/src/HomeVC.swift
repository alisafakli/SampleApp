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
        Utilities.shared.moveBackground(vw: self.backgroundImageView)
        getUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func getUsers() {
        RestApiManager.shared.getUsers(onCompletion: { userModelArray in
            DispatchQueue.main.async(){
                self.userModelArray = userModelArray
                self.tableView.reloadData()
            }

        })
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
        self.performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScene = segue.destination as? DetailVC {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedUser = userModelArray[indexPath.row]
                nextScene.userModel = selectedUser
                let backItem = UIBarButtonItem()
                backItem.title = ""
                self.navigationController?.navigationBar.tintColor = UIColor.white
                navigationItem.backBarButtonItem = backItem
            }
        }


    }
    
}

