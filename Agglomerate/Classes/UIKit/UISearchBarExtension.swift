//
//  UISearchBarExtension.swift
//  TheWing
//
//  Created by Luna An on 4/5/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    // MARK: - Public Functions

    /// Sets the text field's background color with a color of choice.
    ///
    /// - Parameter color: The color to apply.
    func setTextFieldColor(color: UIColor) {
        if let textField = getViewElement(type: UITextField.self) {
            switch searchBarStyle {
            case .minimal:
                textField.layer.backgroundColor = color.cgColor
            case .prominent, .default:
                textField.backgroundColor = color
            }
        }
    }
    
    // MARK: - Private Functions
    
    private func getViewElement<T>(type: T.Type) -> T? {
        let views = subviews.flatMap { $0.subviews }
        
        guard let element = (views.filter { $0 is T }).first as? T else {
            return nil
        }
        
        return element
    }
    
}
