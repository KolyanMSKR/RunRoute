//
//  Extension+UITextField.swift
//  RunRoute
//
//  Created by Admin on 11/7/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String = "Placeholder",
                     font: UIFont = .systemFont(ofSize: 16),
                     textColor: UIColor = .white,
                     borderStyle: UITextField.BorderStyle = .none,
                     keyboardType: UIKeyboardType = .default,
                     keyboardAppearance: UIKeyboardAppearance = .dark,
                     isSecureTextEntry: Bool = false,
                     padding: CGFloat = 16) {
        
        self.init()
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.font = font
        self.textColor = textColor
        self.borderStyle = borderStyle
        self.keyboardType = keyboardType
        self.keyboardAppearance = keyboardAppearance
        self.isSecureTextEntry = isSecureTextEntry
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
