//
//  ProfileViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/20/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.translucent = true
        self.tabBarController?.tabBar.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        self.checkTokenStatus()
    }
    
    func checkTokenStatus(){
        do{
            let _ = try OAuth.shared.accessToken()
        } catch _ { self.presentLoginViewController() }
    }
    
    
    func presentLoginViewController()
    {
        let loginVC = HomeViewController()
        self.presentViewController(loginVC, animated: true, completion: nil)
    }
    

    
}
