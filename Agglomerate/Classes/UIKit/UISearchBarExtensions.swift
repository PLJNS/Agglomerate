import Foundation

public extension UISearchBar {
    
    private func getViewElement<T>(type: T.Type) -> T? {
        let barSubviews = subviews.flatMap { $0.subviews }
        
        guard let element = (barSubviews.filter { $0 is T }).first as? T else {
            return nil
        }
        return element
    }
    
    /// Sets the background color of UISearchBar's built-in UITextField.
    ///
    /// - Parameter color: Background color.
    func setTextFieldBackground(color: UIColor) {
        if let textField = getViewElement(type: UITextField.self) {
            switch searchBarStyle {
            case .minimal:
                textField.layer.backgroundColor = color.cgColor
                textField.layer.cornerRadius = 5
            case .prominent, .default:
                textField.backgroundColor = color
            }
        }
    }
    
    /// Sets the tint color of UISearchBar's built-in UITextField.
    ///
    /// - Parameter color: The tint color.
    func setTextFieldTint(color: UIColor) {
        if let textField = getViewElement(type: UITextField.self) {
            textField.tintColor = color
        }
    }
    
    /// Sets the font of UISearchBar's built-in UITextField.
    ///
    /// - Parameter font: The font.
    func setTextField(font: UIFont) {
        if let textField = getViewElement(type: UITextField.self) {
            textField.font = font
        }
    }
    
    /// Sets the attributed placeholder text of UISearchBar's built-in UITextField.
    ///
    /// - Parameter placeholder: The placeholder.
    func setAttributedText(placeholder: NSAttributedString) {
        if let textField = getViewElement(type: UITextField.self) {
            textField.attributedPlaceholder = placeholder
        }
    }
}
