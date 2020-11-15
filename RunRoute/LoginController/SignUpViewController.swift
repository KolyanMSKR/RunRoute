//
//  SignUpViewController.swift
//  RunRoute
//
//  Created by Admin on 11/7/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let signUpView = SignUpView()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = signUpView
        
        signUpView.alreadyHaveAccountButton.addTarget(self, action: #selector(alreadyHaveAccountButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    
    @objc private func alreadyHaveAccountButtonAction() {
        dismiss(animated: true)
    }
    
}
