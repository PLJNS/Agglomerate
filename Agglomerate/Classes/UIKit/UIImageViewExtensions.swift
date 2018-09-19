extension UIImageView {
    
    /// Convience init with content mode
    ///
    /// - Parameters:
    ///   - image: The image you want
    ///   - contentMode: The content mode you want
    convenience init(image: UIImage?, contentMode: UIViewContentMode = .scaleToFill) {
        self.init(image: image)
        self.contentMode = contentMode
    }
    
}
