//
//  ProfileViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/15/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var homeAirportLabel: UILabel!
    @IBOutlet weak var profilePostsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRounded()
        // Do any additional setup after loading the view.
    }

    func makeRounded() {

        profilePictureImageView.layer.borderWidth = 1
        profilePictureImageView.layer.masksToBounds = false
        profilePictureImageView.layer.borderColor = UIColor.black.cgColor
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.height/2 //This will change with corners of image and height/2 will make this circle shape
        profilePictureImageView.clipsToBounds = true
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
