//
//  SignUpViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController
{
    @IBOutlet weak var firstNameTextLabel: UITextField!
    @IBOutlet weak var lastNameTextLabel: UITextField!
    @IBOutlet weak var emailTextLabel: UITextField!
    @IBOutlet weak var usernameTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: UITextField!
    @IBOutlet weak var confirmPasswordTextLabel: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func createUserAction(sender: UIButton)
    {
        self.signupForApp()
    }
    
    func signupForApp()
    {
//        let postData: [String : AnyObject] = [
//            "first" : self.firstNameTextLabel.text!, //come back to fix the force unwrapping
//            "last" : self.lastNameTextLabel.text!,
//            "email" : self.emailTextLabel.text!,
//            "username" : self.usernameTextLabel.text!,
//            "password" : self.passwordTextLabel.text!,
//            "confirmpassword" : self.confirmPasswordTextLabel.text!
//            ]

        let postInfo = "first=\(self.firstNameTextLabel.text)&last=\(self.lastNameTextLabel.text)&email=\(self.emailTextLabel.text)&username=\(self.usernameTextLabel.text)&password=\(self.passwordTextLabel.text)&confirmpassword=\(self.confirmPasswordTextLabel.text)"
        let postData = postInfo.dataUsingEncoding(NSUTF8StringEncoding)
        
        let urlPath = NSURL(string: "https://closetx.herokuapp.com/api/signup")!
        let request = NSMutableURLRequest(URL: urlPath)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData

//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/x-wwww-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            if error != nil {
                return
            } else {
                print(request)
            }
            
            let response = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(response)
            do {
                if let convertinJSON = try NSJSONSerialization.dataWithJSONObject(postInfo, options: .PrettyPrinted) {
                    print(convertinJSON)
                } else {
                    print("Something is wrong")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}





















