//
//  AppDelegate.swift
//  closetX
//
//  Created by Lacey Vu on 4/18/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import CoreData



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, HomeViewControllerDelegate {

    var window: UIWindow?
    var homeViewController: HomeViewController?
    var tabbarController: UITabBarController?
    var navigationController: UINavigationController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        self.style()
        return true
    }

    
    func style ()
    {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    func presentLoginViewController()
    {
        guard let tabbarController = self.window?.rootViewController as? UITabBarController else { fatalError("root VC Changes") }
        guard let storyboard = tabbarController.storyboard else { fatalError("how does VC not have Storybaord") }
        guard let homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as? HomeViewController else { fatalError() }
        homeViewController.delegate = self
        
        guard let mainNavigationController = tabbarController.viewControllers?.first as? UINavigationController else { return }
        
        mainNavigationController.setNavigationBarHidden(true, animated: false)
        tabbarController.tabBar.hidden = true
        
        guard let mainViewController = mainNavigationController.viewControllers.first as? ProfileViewController else { return }
        
        mainViewController.addChildViewController(homeViewController)
        mainViewController.view.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(tabbarController)
        
        self.homeViewController = homeViewController
        self.tabbarController = tabbarController

    }
    
    func homeViewControllerDidFinishLogin()
    {
        if let homeViewController = self.homeViewController{
            homeViewController.view.removeFromSuperview()
            homeViewController.removeFromParentViewController()
            self.tabbarController?.tabBar.hidden = false
        }
        
    }

}

