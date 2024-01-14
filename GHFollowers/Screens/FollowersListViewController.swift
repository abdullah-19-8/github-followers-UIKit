//
//  FollowersListViewController.swift
//  GHFollowers
//
//  Created by Abdulla Ahmad on 1/14/24.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
