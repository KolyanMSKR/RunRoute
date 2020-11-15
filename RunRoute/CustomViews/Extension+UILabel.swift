//
//  Extension+UILabel.swift
//  RunRoute
//
//  Created by Admin on 10/24/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(title: String = "label",
                     font: UIFont = .systemFont(ofSize: 14),
                     textColor: UIColor = .black,
                     numberOfLines: Int = 1,
                     lineBreakMode: NSLineBreakMode = .byTruncatingTail,
                     textAlignment: NSTextAlignment = .center) {
        
        self.init()
        self.text = title
        self.font = font
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
        self.textAlignment = textAlignment
        self.textColor = textColor
        translatesAutoresizingMaskIntoConstraints = false
    }
}
