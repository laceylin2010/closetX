//
//  FollowingViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/20/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class FollowingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    var images = [String]()
    
    @IBOutlet weak var shirtCollectionView: UICollectionView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupImagesForShirts()

        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

    func setupImagesForShirts()
    {
        for i in 0...4 {
            images.append("\(i).JPG")
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
         return self.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let shirtCell = self.shirtCollectionView.dequeueReusableCellWithReuseIdentifier("shirtImageCell", forIndexPath: indexPath) as! FollowersCollectionCell
        shirtCell.image = UIImage(named:images[indexPath.row])!
        return shirtCell
    }

}
