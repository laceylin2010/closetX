//
//  UploadViewController.swift
//  closetX
//
//  Created by Lacey Vu on 4/20/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import Photos

class UploadViewController: UIViewController
{
    
    lazy var imagePicker = UIImagePickerController()
    
    

    @IBAction func camera(sender: AnyObject)
    {
       self.showImagePicker(.Camera)
    
    }
    @IBAction func photoLibraryView(sender: AnyObject)
    {
       let libraryAuth = PHPhotoLibrary.authorizationStatus()
        if libraryAuth == PHAuthorizationStatus.Denied
        {
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                 self.presentDeniedAccessVC()
            })
        }
        else {
            NSOperationQueue.mainQueue().addOperationWithBlock({ 
                self.showImagePicker(.PhotoLibrary)
            })
        }

    }
    

    func presentDeniedAccessVC()
    {
       let alertView = UIAlertController(title: "Error", message: "PLEASE ALLOW ACCESS TO PHOTOS IN SETTINGS", preferredStyle: .Alert)
       let ok = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertView.addAction(ok)
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    
    func showImagePicker(source: UIImagePickerControllerSourceType)
    {
        self.imagePicker.sourceType = source
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
 
    
    @IBAction func dismissVC(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
}
