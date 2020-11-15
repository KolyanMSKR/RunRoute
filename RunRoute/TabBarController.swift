//
//  TabBarController.swift
//  RunRoute
//
//  Created by Admin on 15.10.2020.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit
import Firebase

class TabBarController: UITabBarController {
    /*
    private let currentUser: User
    
    // MARK: - Inits
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    // MARK: - Private methods
    
    private func setTabBar() {
        /*let activityViewController = ActivityViewController()
        activityViewController.tabBarItem = UITabBarItem(title: "Activity", image: #imageLiteral(resourceName: "Activity"), selectedImage: #imageLiteral(resourceName: "Activity"))
        
        viewControllers = [activityViewController, UIViewController()]*/
    }
    
}
