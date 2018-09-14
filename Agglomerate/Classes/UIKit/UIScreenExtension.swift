import UIKit

extension UIScreen {
    
    /// Returns the screen width.
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Returns the screen height.
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }

    /// Returns the size of the screen.
    static var size: CGSize {
        return CGSize(width: UIScreen.width, height: UIScreen.height)
    }
    
}
