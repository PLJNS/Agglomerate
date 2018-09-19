extension CALayer {
    
    func applySketchShadow(color: UIColor, alpha: Float = 1, shadowOffset: CGSize = .zero, blur: CGFloat, spread: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        self.shadowOffset = shadowOffset
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let differenceInX = -spread
            let rect = bounds.insetBy(dx: differenceInX, dy: differenceInX)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }

}
