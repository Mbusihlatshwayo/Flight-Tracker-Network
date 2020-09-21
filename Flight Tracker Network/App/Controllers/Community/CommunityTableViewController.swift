//
//  CommunityTableViewController.swift
//  Flight Tracker Network
//
//  Created by Mbusi Hlatshwayo on 9/6/20.
//  Copyright © 2020 Mbusi Hlatshwayo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class CommunityTableViewController: UITableViewController {
        
    lazy var newPostButton = UIBarButtonItem(image: UIImage(named: "newPost"), style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    var handle: AuthStateDidChangeListenerHandle?
    var imagePicker: ImagePicker!
    private let firebaseStorage = Storage.storage().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(
                nibName: "CommunityPostTableViewCell",
                bundle: Bundle.main),
            forCellReuseIdentifier: "communityPostCell")
        newPostButton.target = self
        newPostButton.action = #selector(didPressNewPost)
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

    }

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.rightBarButtonItem = newPostButton
        self.tabBarController?.navigationItem.title = "FTN Posts"
        
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @objc func didPressNewPost(sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "communityPostCell", for: indexPath)
//        cell.layer.borderColor = tableView.separatorColor?.cgColor
//        cell.layer.borderWidth = 1.0
//        cell.layer.cornerRadius = 6.0

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        10
//    }

}

extension CommunityTableViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
//        self.imageView.image = image
        guard let imageData = image?.pngData() else {
           return
        }
        print("got image data \(imageData)")
        let firStorageReference = firebaseStorage.child("images/post.png")
        firStorageReference.putData(imageData, metadata: nil) { (_, error) in
            guard error == nil else {
                print("Firebase upload failed with error \(error!)")
                return
            }
            firStorageReference.downloadURL { (url, error) in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                print("URL String for image = \(urlString)")
            }
        }
    }
}
