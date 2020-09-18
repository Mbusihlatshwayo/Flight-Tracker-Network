//
//  AuthenticationViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/15/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class AuthenticationViewController: UIViewController {

    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        googleSignInButton.style = .wide
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
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
