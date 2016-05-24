//
//  ViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/18/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class
{
    func homeViewControllerDidFinishLogin()
    
}

class HomeViewController: UIViewController
{
    
    weak var delegate: HomeViewControllerDelegate?
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
                    self.delegate?.homeViewControllerDidFinishLogin()
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Invalid Username or Password", preferredStyle: .Alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
       
            }
        } else{print("error")}
        
    }
 
}






























































