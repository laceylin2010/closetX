//
//  ViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/18/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import Parse
import ParseUI


protocol HomeViewControllerDelegate: class
{
    func homeViewControllerDidFinishLogin()
    
}

class HomeViewController: UIViewController, PFLogInViewControllerDelegate
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
        if (PFUser.currentUser() == nil) {
            let loginController = PFLogInViewController()
            loginController.delegate = self
            loginController.presentViewController(loginController, animated: true, completion: nil)
        } else {
            return
        }
    }
}






























































