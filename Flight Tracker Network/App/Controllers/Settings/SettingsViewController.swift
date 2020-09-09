//
//  SettingsViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/6/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Settings"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil 
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
