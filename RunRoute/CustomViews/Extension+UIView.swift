//
//  Extension+UIView.swift
//  RunRoute
//
//  Created by Admin on 11/7/20.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchors(top: NSLayoutYAxisAnchor? = nil,
                 left: NSLayoutXAxisAnchor? = nil,
                 bottom: NSLayoutYAxisAnchor? = nil,
                 right: NSLayoutXAxisAnchor? = nil,
                 paddingTop: CGFloat = 0,
                 paddingLeft: CGFloat = 0,
                 paddingBottom: CGFloat = 0,
                 paddingRight: CGFloat = 0,
                 width: CGFloat? = nil,
                 height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(in view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let containerView = UIView()
        
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.75
        
        containerView.addSubview(imageView)
        containerView.addSubview(textField)
        
        imageView.centerY(in: containerView)
        imageView.anchors(left: containerView.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        textField.centerY(in: containerView)
        textField.anchors(left: imageView.rightAnchor,
                          bottom: containerView.bottomAnchor,
                          right: containerView.rightAnchor,
                          paddingLeft: 8,
                          paddingBottom: -8,
                          paddingRight: -8)
        
        let separatorView = UIView()
        containerView.addSubview(separatorView)
        separatorView.backgroundColor = .lightGray
        separatorView.anchors(left: containerView.leftAnchor,
                              bottom: containerView.bottomAnchor,
                              right: containerView.rightAnchor,
                              paddingLeft: 8,
                              height: 0.75)
        
        return containerView
    }
    
}
