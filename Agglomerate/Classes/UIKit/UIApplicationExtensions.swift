extension UIApplication {
    
    /// Opens user's settings.
    func openSettings() {
        if let url = URL(string: UIApplicationOpenSettingsURLString) {
            open(url, options: [:], completionHandler: nil)
        }
    }

    /// Attempts to make a phone call for the given phone number.
    ///
    /// - Parameter phoneNumber: The phone nubmer to call.
    func placeCall(for phoneNumber: String) {
        guard let phoneNumberURL = URL(string: "telprompt://\(phoneNumber)"), canOpenURL(phoneNumberURL) else {
            return
        }
        
        open(phoneNumberURL, options: [:], completionHandler: nil)
    }
}
