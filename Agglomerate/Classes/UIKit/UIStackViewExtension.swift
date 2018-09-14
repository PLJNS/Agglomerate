import UIKit

extension UIStackView {
    
    /// Removes all arranged subviews.
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    /// a convinience intializer for stack view which conviniently wraps up all the things you probably want to set.
    ///
    /// - Parameters:
    ///   - arrangedSubviews: what subviews do you want in the stack view
    ///   - axis: the axis of the stack view
    ///   - distribution: the distribution of the stack view
    ///   - alignment: the alignment of the stack view
    ///   - spacing: the spacing of the stack view
    convenience init(arrangedSubviews: [UIView],
                     axis: UILayoutConstraintAxis,
                     distribution: UIStackViewDistribution,
                     alignment: UIStackViewAlignment,
                     spacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    
}
