//
//  ViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/18/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import Parse

protocol HomeViewControllerDelegate: class
{
    func homeViewControllerDidFinishLogin()
    
}

class HomeViewController: UIViewController
{
    
    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
     

    }
    
    func login()
    {
        if (PFUser != PFUser.currentUser) {
            
        }
    }
}






























































