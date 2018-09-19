extension UIAlertController {
    
    /// SwifterSwift: Add an action to Alert
    ///
    /// - Parameters:
    ///   - title: action title
    ///   - style: action style (default is UIAlertActionStyle.default)
    ///   - isEnabled: isEnabled status for action (default is true)
    ///   - handler: optional action handler to be called when button is tapped (default is nil)
    /// - Returns: action created by this method
    @discardableResult public func addAction(title: String, style: UIAlertActionStyle = .default, isEnabled: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        action.isEnabled = isEnabled
        addAction(action)
        return action
    }
    
    /// SwifterSwift: Add a text field to Alert
    ///
    /// - Parameters:
    ///   - text: text field text (default is nil)
    ///   - placeholder: text field placeholder text (default is nil)
    ///   - editingChangedTarget: an optional target for text field's editingChanged
    ///   - editingChangedSelector: an optional selector for text field's editingChanged
    public func addTextField(text: String? = nil, placeholder: String? = nil, editingChangedTarget: Any?, editingChangedSelector: Selector?) {
        addTextField { textField in
            textField.text = text
            textField.placeholder = placeholder
            if let target = editingChangedTarget, let selector = editingChangedSelector {
                textField.addTarget(target, action: selector, for: .editingChanged)
            }
        }
    }
}

extension UIAlertController {
    
    /// SwifterSwift: Create new alert view controller with default OK action.
    ///
    /// - Parameters:
    ///   - title: alert controller's title.
    ///   - message: alert controller's message (default is nil).
    ///   - defaultActionButtonTitle: default action button title (default is "OK")
    ///   - tintColor: alert controller's tint color (default is nil)
    public convenience init(title: String, message: String? = nil, defaultActionButtonTitle: String = "OK", tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }
    
    /// SwifterSwift: Create new error alert view controller from Error with default OK action.
    ///
    /// - Parameters:
    ///   - title: alert controller's title (default is "Error").
    ///   - error: error to set alert controller's message to it's localizedDescription.
    ///   - defaultActionButtonTitle: default action button title (default is "OK")
    ///   - tintColor: alert controller's tint color (default is nil)
    public convenience init(title: String = "Error", error: Error, defaultActionButtonTitle: String = "OK", preferredStyle: UIAlertControllerStyle = .alert, tintColor: UIColor? = nil) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: preferredStyle)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        addAction(defaultAction)
        if let color = tintColor {
            view.tintColor = color
        }
    }
    
    convenience init(confirmationWithTitle title: String,
                     message: String,
                     confirmationActionTitle: String,
                     cancelActionTitle: String,
                     with completion: @escaping (_ confirmed: Bool) -> ()) {
        self.init(title: title,
                  message: message,
                  preferredStyle: .alert)
        addAction(UIAlertAction(title: confirmationActionTitle,
                                style: .destructive,
                                handler: { (_) in
                                    completion(true)
        }))
        addAction(UIAlertAction(title: cancelActionTitle,
                                style: .cancel,
                                handler: { (_) in
                                    completion(false)
        }))
    }
    
    convenience init(inputWithTitle title: String,
                     message: String,
                     placeholder: String?,
                     confirmationActionTitle: String?,
                     completion: @escaping (_ input: String?) -> ()) {
        self.init(title: title, message: message, preferredStyle: .alert)
        addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
            textField.placeholder = placeholder
            textField.autocapitalizationType = .words
        })
        addAction(UIAlertAction(title: confirmationActionTitle, style: .default, handler: {(_ action: UIAlertAction) -> Void in
            completion(self.textFields?[0].text)
        }))
    }
}
