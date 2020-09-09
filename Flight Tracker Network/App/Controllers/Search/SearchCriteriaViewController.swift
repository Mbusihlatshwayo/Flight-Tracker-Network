//
//  SearchCriteriaViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/7/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class SearchCriteriaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
