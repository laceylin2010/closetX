//
//  FollowingCollectionFlowLayout.swift
//  closetX
//
//  Created by Lauren Spatz on 4/21/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class FollowingCollectionFlowLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout
{
    
    var columns: Int
    var spacing: CGFloat = 1.0
    
    init(columns: Int = 1){
        self.columns = columns
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup ()
    {
        self.minimumLineSpacing = self.spacing
        self.minimumInteritemSpacing = self.spacing
        self.itemSize = CGSize(width: self.itemWidth(), height: self.itemWidth())
    }
    
    func screenWidth () -> CGFloat
    {
        return CGRectGetWidth(UIScreen.mainScreen().bounds)
    }
    
    func itemWidth() -> CGFloat
    {
        let width = self.screenWidth()
        let availableWidth = width - (CGFloat(self.columns)*self.spacing)
        return availableWidth / CGFloat(self.columns)
    }
    
    func scrolling()
    {
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .Horizontal
        }
    }
    
    
}
