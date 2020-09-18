//
//  RootTabBarController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/6/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import FirebaseAuth

class RootTabBarController: UITabBarController {
    
    var profileViewController: ProfileViewController?
    var authenticationViewController: AuthenticationViewController?
//    private lazy var authenticationViewController: AuthenticationViewController = {
//        let view = AuthenticationViewController(
//    }
    var handle: AuthStateDidChangeListenerHandle?

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
//            let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//        } catch let signOutError as NSError {
//          print ("Error signing out: %@", signOutError)
//        }
        setUpAuthHandler()
    }
    
    func setUpAuthHandler() {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                // User is signed in. Show home screen
                self.configureTabBarViews(loggedInStatus: true)
            } else {
                // No User is signed in. Show user the login screen
                self.configureTabBarViews(loggedInStatus: false)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureTabBarViews(loggedInStatus authStatus: Bool) {
        
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), selectedImage: UIImage(named: "profileSelected"))

        let flightsViewController = FlightsViewController()
        flightsViewController.tabBarItem = UITabBarItem(title: "Flights", image: nil, tag: 0)

        let communityViewController = CommunityTableViewController()
        communityViewController.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(named: "posts"), selectedImage: UIImage(named: "postsFilled"))
        
        let searchCriteriaViewController = SearchCriteriaViewController()
        searchCriteriaViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "searchIcon"), selectedImage: UIImage(named: "searchIconFilled"))
        
        profileViewController = ProfileViewController()
        profileViewController?.tabBarItem = profileTabBarItem
        
        authenticationViewController = AuthenticationViewController()
        authenticationViewController?.tabBarItem = profileTabBarItem
        
        viewControllers = [flightsViewController ,communityViewController , searchCriteriaViewController]
        
        if authStatus == true {
            self.viewControllers?.append(profileViewController ?? ProfileViewController())
//            self.selectedIndex = 3
        } else {
            self.viewControllers?.append(authenticationViewController ?? AuthenticationViewController())
        }
    }
    
}

extension RootTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}
