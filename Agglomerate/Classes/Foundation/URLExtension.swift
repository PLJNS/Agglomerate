import Foundation

extension URL {

    /// Initializes a url with the given email.
    ///
    /// - Parameter email: Email to mail to.
    init?(email: String) {
        self.init(string: "mailto:\(email)")
    }

}
