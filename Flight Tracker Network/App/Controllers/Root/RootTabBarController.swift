//
//  RootTabBarController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/6/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        let flightsViewController = FlightsViewController()
        flightsViewController.tabBarItem = UITabBarItem(title: "Flights", image: nil, tag: 0)

        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon"), selectedImage: UIImage(named: "profileSelected"))

        let communityViewController = CommunityTableViewController()
        communityViewController.tabBarItem = UITabBarItem(title: "Posts", image: nil, tag: 2)
        
        let searchCriteriaViewController = SearchCriteriaViewController()
        searchCriteriaViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "searchIcon"), selectedImage: UIImage(named: "searchIconFilled"))
        
        self.viewControllers = [flightsViewController ,communityViewController , searchCriteriaViewController, profileViewController]
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension RootTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
    }
    
}
