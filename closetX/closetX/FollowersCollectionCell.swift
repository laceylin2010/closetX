//
//  FollowersCollectionCell.swift
//  closetX
//
//  Created by Lacey Vu on 4/21/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class FollowersCollectionCell: UICollectionViewCell
{
    @IBOutlet weak var shirtsImageView: UIImageView!
    
    var image: UIImage = UIImage() {
        didSet {
            shirtsImageView.image = image
        }
    }
    
    
}
