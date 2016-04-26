//
//  ViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/18/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{

    
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var loginUsernameTextField: UITextField!
 
    
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

    
    @IBAction func loginAction(sender: UIButton)
    {
        if let password = self.loginPasswordTextField.text{
            if let username = self.loginUsernameTextField.text{
            OAuth.shared.loginToApp(username, password: password, completion: { (success) in
                if success{
                self.performSegueWithIdentifier("tabbarSegue", sender: nil)
                }
            })
       
            }
        } else{print("error")}
        
    }
 
}






























































