import UIKit

extension UIApplication {
    
    /// Opens user's settings.
    func openSettings() {
        if let url = URL(string: UIApplicationOpenSettingsURLString) {
            open(url, options: [:], completionHandler: nil)
        }
    }

}
