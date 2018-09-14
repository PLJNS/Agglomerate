import UIKit

extension UIImage {
    
    /// Returns image data if available.
    var imageData: Data? {
        return UIImageJPEGRepresentation(self, 1)
    }
    
    /// Compares two images using their image data.
    ///
    /// - Parameter image: Image to compare to.
    /// - Returns: Flag if the two images are the same.
    func isEqualToImage(image: UIImage) -> Bool {
        guard let imageData = imageData, let anotherImageData =  image.imageData else {
            return false
        }
        
        return imageData == anotherImageData
    }
    
}
