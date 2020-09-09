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

        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: nil, tag: 1)

        let communityViewController = CommunityTableViewController()
        communityViewController.tabBarItem = UITabBarItem(title: "Posts", image: nil, tag: 2)
        
        let searchCriteriaViewController = SearchCriteriaViewController()
        searchCriteriaViewController.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 3)
        
        self.viewControllers = [flightsViewController ,communityViewController , searchCriteriaViewController, settingsViewController]
    
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
