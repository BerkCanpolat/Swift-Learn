//
//  FollowViewController.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 1.03.2025.
//

import UIKit

class FollowViewController: UITableViewController, UserCellDelegate {
    
    var users = [UserModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FollowTableViewCell.self, forCellReuseIdentifier: FollowTableViewCell.identifier)
        tableView.rowHeight = 88
        tableView.tableFooterView = UIView()
        
        configureUsers()
        
    }
    
    func configureUsers() {
        let user1 = UserModel(userName: "Batman", fullName: "Bruce Wayne", profileImage: UIImage(named: "1"), isFollowed: false)
        let user2 = UserModel(userName: "Joker", fullName: "Heath Ledger", profileImage: UIImage(named: "2"), isFollowed: false)
        let user3 = UserModel(userName: "Superman", fullName: "Clark Kent", profileImage: UIImage(named: "3"), isFollowed: false)
        let user4 = UserModel(userName: "Venom", fullName: "Eddie Brock", profileImage: UIImage(named: "4"), isFollowed: false)
        let user5 = UserModel(userName: "Spiderman", fullName: "Peter Parker", profileImage: UIImage(named: "5"), isFollowed: false)
        let user6 = UserModel(userName: "Ironman", fullName: "Tony Stark", profileImage: UIImage(named: "1"), isFollowed: false)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
        users.append(user6)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FollowTableViewCell.identifier, for: indexPath) as! FollowTableViewCell
        
        let item = users[indexPath.row]
        cell.delegate = self
        cell.user = item
        
        return cell
    }
    
    func onFollowTap(cell: FollowTableViewCell) {
        print("Handle follow tapped")
        guard let user = cell.user else { return }
        
        if user.isFollowed {
            // unfollow
            cell.followButton.configureExtensionButton(didFollow: false)
        } else {
            // follow
            cell.followButton.configureExtensionButton(didFollow: true)
        }
        
        cell.user?.isFollowed = !user.isFollowed
    }
    

}
