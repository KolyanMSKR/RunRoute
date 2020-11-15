//
//  SignInView.swift
//  RunRoute
//
//  Created by Admin on 11/8/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

class SignInView: UIView {
    
    // MARK: - UI's Outlets
    
    let logoLabel = UILabel(title: "Run Route", font: .boldSystemFont(ofSize: 40), textColor: .lightGray)
    
    let emailTextField = UITextField(placeholder: "Email", keyboardType: .emailAddress)
    let passwordTextField = UITextField(placeholder: "Password", isSecureTextEntry: true)
    
    lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "mail_outline_white"), textField: emailTextField)
        view.anchors(height: 50)
        
        return view
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "lock_outline_white"), textField: passwordTextField)
        view.anchors(height: 50)
        
        return view
    }()
    
    let signInButton = UIButton(type: .system,
                                title: "Sign In",
                                titleColor: .gray,
                                font: .boldSystemFont(ofSize: 20),
                                backgroundColor: .mainBlueTint,
                                cornerRadius: 5,
                                height: 50)
    
    let dontHaveAccountButton = UIButton(type: .system,
                                         title: "Already have an account?",
                                         backgroundColor: .backgroundColor,
                                         height: 32)
    
    private lazy var stackView = UIStackView(arrangedSubviews: [
        emailContainerView,
        passwordContainerView,
        signInButton
    ])
    
    // MARK: - Inits
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .backgroundColor
        
        addSubview(logoLabel)
        logoLabel.centerX(in: self)
        logoLabel.anchors(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        
        setupStackView()
        
        setupDontHaveAccountButton()
        
        signInButton.addTarget(self, action: #selector(selectorAction), for: .touchUpInside)
    }
    
    var loginAction: (() -> ())?
    @objc private func selectorAction() {
        print("loginAction")
        
        loginAction?()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        
        stackView.centerX(in: self)
        stackView.anchors(top: logoLabel.bottomAnchor,
                          left: self.leftAnchor,
                          right: self.rightAnchor,
                          paddingTop: 40,
                          paddingLeft: 20,
                          paddingRight: -20)
        
        stackView.axis = .vertical
        stackView.spacing = 24
    }
    
    func setupDontHaveAccountButton() {
        addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(in: self)
        dontHaveAccountButton.anchors(bottom: self.safeAreaLayoutGuide.bottomAnchor)
        
        var attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                          NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: attributes)
        
        attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                      NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: attributes))
        dontHaveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
}
