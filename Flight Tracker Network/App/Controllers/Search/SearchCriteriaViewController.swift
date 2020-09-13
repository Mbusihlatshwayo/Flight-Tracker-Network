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

        ServiceLayer.request(router: Router.getLiveFlights) { (result: Result<[String : [Flight]], Error>) in
            switch result {
            case .success:
                print(result)
            case .failure:
                print(result)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Search"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }

    func presentSearchViewController(title: String) {
        let vc = SearchViewController()
        vc.title = title
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func searchByAirline(_ sender: Any) {
        presentSearchViewController(title: "Airlines")
    }
    
    @IBAction func searchByDepartureAirport(_ sender: Any) {
        presentSearchViewController(title: "Airports")
    }
    
    @IBAction func searchByArrivalAirport(_ sender: Any) {
        presentSearchViewController(title: "Airports")
    }

}
