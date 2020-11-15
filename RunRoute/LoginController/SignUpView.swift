//
//  SignUpView.swift
//  RunRoute
//
//  Created by Admin on 11/7/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    // MARK: - UI's Outlets
    
    let selectProfilePhotoButton = UIButton(type: .system,
                                            title: "Select Profile Photo",
                                            titleColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                                            font: .systemFont(ofSize: 32, weight: .heavy),
                                            cornerRadius: 100,
                                            height: 200)
    
    let firstNameTextField = UITextField(placeholder: "First name")
    let lastNameTextField = UITextField(placeholder: "Last name")
    let emailTextField = UITextField(placeholder: "Email", keyboardType: .emailAddress)
    let passwordTextField = UITextField(placeholder: "Password", isSecureTextEntry: true)
    
    lazy var firstNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "person_outline_white"), textField: firstNameTextField)
        view.anchors(height: 50)
        
        return view
    }()
    
    lazy var lastNameContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "person_outline_white"), textField: lastNameTextField)
        view.anchors(height: 50)
        
        return view
    }()
    
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
    
    let signUpButton = UIButton(type: .system,
                                title: "Sign Up",
                                titleColor: .gray,
                                font: .boldSystemFont(ofSize: 20),
                                backgroundColor: .mainBlueTint,
                                cornerRadius: 5,
                                height: 50)
    
    let alreadyHaveAccountButton = UIButton(type: .system,
                                            title: "Already have an account?",
                                            backgroundColor: .backgroundColor,
                                            height: 32)
    
    private lazy var stackView = UIStackView(arrangedSubviews: [
        firstNameContainerView,
        lastNameContainerView,
        emailContainerView,
        passwordContainerView,
        signUpButton
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
        
        addSubview(selectProfilePhotoButton)
        
        selectProfilePhotoButton.centerX(in: self)
        selectProfilePhotoButton.anchors(top: self.safeAreaLayoutGuide.topAnchor, paddingTop: 20, width: 200, height: 200)
        
        setupStackView()
        
        
        setupAlreadyHaveAccountButton()
    }
    
    private func setupStackView() {
        addSubview(stackView)
        
        stackView.centerX(in: self)
        stackView.anchors(top: selectProfilePhotoButton.bottomAnchor,
                          left: self.leftAnchor,
                          right: self.rightAnchor,
                          paddingTop: 20,
                          paddingLeft: 20,
                          paddingRight: -20)
        
        stackView.axis = .vertical
        stackView.spacing = 16
    }
    
    private func setupAlreadyHaveAccountButton() {
        addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(in: self)
        alreadyHaveAccountButton.anchors(bottom: self.safeAreaLayoutGuide.bottomAnchor)
        
        var attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                          NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: attributes)
        
        attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                      NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: attributes))
        alreadyHaveAccountButton.setAttributedTitle(attributedTitle, for: .normal)
    }
    
}



class AttributedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
