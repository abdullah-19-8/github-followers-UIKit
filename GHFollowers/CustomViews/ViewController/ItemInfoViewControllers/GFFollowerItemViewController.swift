//
//  GFFollowerItemViewController.swift
//  GHFollowers
//
//  Created by Abdulla Ahmad on 1/28/24.
//

import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers. What a shame 😔.", buttonTitle: "So sad")
            return
        }
        delegate.didTapGetFollowers(for: user)
        dismiss(animated: true)
    }
}

