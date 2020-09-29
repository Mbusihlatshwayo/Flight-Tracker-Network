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
import FirebaseDatabase

class CommunityTableViewController: UITableViewController {
        
    lazy var newPostButton = UIBarButtonItem(image: UIImage(named: "newPost"), style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    var handle: AuthStateDidChangeListenerHandle?
    var imagePicker: ImagePicker!
    private let firebaseStorage = Storage.storage().reference()
    var ref = Database.database().reference()
    var communityPosts = [CommunityPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(
            UINib(
                nibName: "CommunityPostTableViewCell",
                bundle: Bundle.main),
            forCellReuseIdentifier: "communityPostCell")
        fetchCommunityPosts()
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
    
    func fetchCommunityPosts() {
        print("AUTH STATUS \(Auth.auth())")
        ref.child("posts").observeSingleEvent(of: .value) { (snapshot) in
            let postsResult = snapshot.value as? NSDictionary
            for (_,postContent) in postsResult! {
                let postContent = postContent as! NSDictionary
                let post = CommunityPost(numberOfLikes: postContent["numberOfLikes"] as? Int ?? 0, postLocation: postContent["postLocation"] as? String, postPhotoURL: postContent["postPhotoURL"] as! String, userID: postContent["userID"] as! String, userPhotoURL: postContent["userPhotoURL"] as? String, username: postContent["username"] as! String)
                self.communityPosts.append(post)
            }
            self.tableView.reloadData()
        } withCancel: { (error) in
            print(error.localizedDescription)
        }
    }
    //MARK: - Navigation
    
    func presentImagePostViewController(title: String, with image: UIImage) {
        let vc = CreatePostViewController()
        vc.title = title
        vc.postImage = image
        self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communityPosts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "communityPostCell", for: indexPath) as? CommunityPostTableViewCell ?? CommunityPostTableViewCell()
        cell.usernameLabel.text = communityPosts[indexPath.row].username
        cell.locationNameLabel.text = communityPosts[indexPath.row].postLocation
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        400
    }

}

extension CommunityTableViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        guard let selectedImage = image else {
           return
        }
        presentImagePostViewController(title: "New Post", with: selectedImage)
    }
    
}
