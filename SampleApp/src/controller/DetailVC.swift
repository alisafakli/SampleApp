//
//  DetailVC.swift
//  SampleApp
//
//  Created by Ali Safakli on 10/03/2017.
//  Copyright © 2017 Asafakli. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var userModel: UserModel!
    var postModelArray: [PostModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPostsBy(userId: userModel.id)
    }
    
    func getPostsBy(userId: Int) {
        RestApiManager.shared.getPostsBy(userId: userModel.id, onCompletion: { postModelArray in
            DispatchQueue.main.async {
                self.postModelArray = postModelArray
                self.collectionView.reloadData()
            }
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = userModel.name
    }

    
    //Collectionview Datasource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detail_cell", for: indexPath) as? DetailCollectionViewCell {
            cell.configure(data: postModelArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postModelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: self.collectionView.frame.size.width, height: self.postModelArray[indexPath.row].body.height(constraintedWidth: self.collectionView.frame.size.width, font: UIFont(descriptor: UIFontDescriptor(), size: 15)) + 80);
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
}
