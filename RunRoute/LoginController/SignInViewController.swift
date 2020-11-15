//
//  SignInViewController.swift
//  RunRoute
//
//  Created by Admin on 11/8/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private let signInView = SignInView()
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = signInView
        
        
        signInView.dontHaveAccountButton.addTarget(self, action: #selector(dontHaveAccountButtonAction), for: .touchUpInside)
        //signInView.signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        signInView.loginAction = { [weak self] in
            self?.signIn()
        }
    }
    
    // MARK: - Selectors
    
    @objc private func dontHaveAccountButtonAction() {
        
        print("sign up")
        
        
        let signUpViewController = SignUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        present(signUpViewController, animated: true)
    }
    
    @objc private func signIn() {
//        let email = signInView.emailTextField.text!
//        let password = signInView.passwordTextField.text!
        
        let email = "qwerty@asdf.gh"
        let password = "qwerty"
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let currentUser = authResult?.user else {
                print(error?.localizedDescription ?? "signIn() error?.localizedDescription")
                return
            }
            
            print("sign in")
            print(currentUser)
            
            let activityViewController = ActivityViewController(currentUser: currentUser)
            let navController = UINavigationController(rootViewController: activityViewController)
            navController.modalPresentationStyle = .fullScreen
            self.present(navController, animated: true)
        }
    }
    
}
