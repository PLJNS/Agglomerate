import Foundation

public extension UIFont {
    
    /// SwifterSwift: Font as bold font
    public var bold: UIFont? {
        if let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) {
            return UIFont(descriptor: descriptor, size: pointSize)
        }
        
        return nil
    }
    
    public var italic: UIFont? {
        if let descriptor = fontDescriptor.withSymbolicTraits(.traitItalic) {
            return UIFont(descriptor: descriptor, size: pointSize)
        }
        
        return nil
    }
    
    /// SwifterSwift: Font as monospaced font
    ///
    ///     UIFont.preferredFont(forTextStyle: .body).monospaced
    ///
    public var monospaced: UIFont {
        let settings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType, UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]
        
        let attributes = [UIFontDescriptor.AttributeName.featureSettings: settings]
        let newDescriptor = fontDescriptor.addingAttributes(attributes)
        return UIFont(descriptor: newDescriptor, size: 0)
    }
    
}
