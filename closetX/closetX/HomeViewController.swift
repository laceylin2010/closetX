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
    
    func loginToApp()
    {
        let urlPath = "https://closetx.herokuapp.com/api/login"
        let url = NSURL(string: urlPath)
        let request = NSMutableURLRequest(URL: url!)
        let username = self.loginUsernameTextField.text
        let password = self.loginPasswordTextField.text
        let loginString = NSString(format: "%@:%@", username!, password!) //come back here
        let loginData = loginString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64LoginString = loginData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
        request.HTTPMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        print(base64LoginString)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
          data, response, error in
            if error != nil {
                return
            } else {
                print(request)
            }
            
            let response = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(response)
            do {
                if let convertingJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    print(convertingJSON)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    @IBAction func loginAction(sender: UIButton)
    {
        loginToApp()
    }
    
}