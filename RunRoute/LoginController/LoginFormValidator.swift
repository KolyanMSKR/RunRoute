//
//  LoginFormValidator.swift
//  RunRoute
//
//  Created by Admin on 07.10.2020.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

class LoginFormValidator {
    
    var profileImage: UIImage? { didSet { profileImageObserver?(profileImage) } }
    var profileImageObserver: ((UIImage?) -> ())?
    
    var firstName: String? { didSet { checkForValidity() } }
    var lastName: String? { didSet { checkForValidity() } }
    var email: String? { didSet { checkForValidity() } }
    var password: String? { didSet { checkForValidity() } }
    var isFormValidObserver: ((Bool) -> ())?
    
    private func checkForValidity() {
        let isFormValid = firstName?.isEmpty == false &&
            lastName?.isEmpty == false &&
            email?.isEmpty == false &&
            password?.isEmpty == false
        
        isFormValidObserver?(isFormValid)
    }
    
}
