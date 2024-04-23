//
//  AppDelegate.swift
//  CombinedExercises
//
//  Created by Jay Bhensdadia on 11/04/24.
//

import UIKit
import SideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
//        for family in UIFont.familyNames{
//               print(family)
//            for name in UIFont.fontNames(forFamilyName: family.description)
//               {
//                   print("  \(name)")
//               }
//           }
//        
        setUpLeftMenu()
        setUpInitialVC()
        
        return true
    }

    
    func setUpInitialVC(){
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Dashboard")
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func setUpLeftMenu(){
        let storyboard = UIStoryboard(name:"Sidemenu", bundle: nil)
        let sidemenuVC = storyboard.instantiateViewController(withIdentifier: "Sidemenu")as! SidemenuVC
        
        let sideMenuViewController = SideMenuNavigationController(rootViewController: sidemenuVC)
        sideMenuViewController.leftSide = true
        sideMenuViewController.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = sideMenuViewController
        SideMenuManager.default.rightMenuNavigationController = sideMenuViewController
        sideMenuViewController.pushStyle = .default
        sideMenuViewController.presentationStyle = .menuSlideIn
        sideMenuViewController.presentationStyle.backgroundColor = .black
        sideMenuViewController.settings.statusBarEndAlpha = 0
        sideMenuViewController.presentationStyle.presentingEndAlpha = 0.6
        let  SCREEN_WIDTH = UIScreen.main.bounds.size.width
        sideMenuViewController.menuWidth = SCREEN_WIDTH * 0.8
    }
}

