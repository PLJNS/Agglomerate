import UIKit
import SafariServices

extension UIViewController {

    /// Opens url from current view controller.
    ///
    /// - Parameter url: URL.
    func open(_ url: URL) {
        let viewController = SFSafariViewController(url: url)
        present(viewController, animated: true, completion: nil)
    }

}


