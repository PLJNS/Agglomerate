extension UIViewController {
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow),
                                               name: .UIKeyboardDidShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: .UIKeyboardWillHide,
                                               object: nil)
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
    }
}

extension NSNotification {
    
    /// If the notification has keyboard information, will return keyboard size
    /// otherwise nil.
    ///
    /// - Returns: Keyboard size if present, otherwise nil.
    func keyboardSize() -> CGRect? {
        return userInfo?[UIKeyboardFrameBeginUserInfoKey] as? CGRect
    }
    
}
