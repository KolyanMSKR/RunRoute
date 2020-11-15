//
//  Extension+UIButton.swift
//  RunRoute
//
//  Created by Admin on 10/24/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(type: ButtonType = .system,
                     title: String = "Button",
                     titleColor: UIColor = .systemBlue,
                     font: UIFont = .systemFont(ofSize: 14),
                     backgroundColor: UIColor = .white,
                     cornerRadius: CGFloat = 20,
                     height: CGFloat = 40) {
        
        self.init(type: type)
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textAlignment = .center
        titleLabel?.font = font
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        layer.backgroundColor = backgroundColor.cgColor
        layer.cornerRadius = cornerRadius
        heightAnchor.constraint(equalToConstant: height).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
