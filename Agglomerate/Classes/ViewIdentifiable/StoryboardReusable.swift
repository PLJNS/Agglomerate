
public protocol StoryboardReusable: class {
    
    /// The storyboard that the view controller can be found in.
    static var reusableStoryboard: UIStoryboard { get }
    
}

public extension StoryboardReusable where Self: UIViewController {

    /**
     Instatiates the view controller from the storyboard.

     - returns: A new instance of the view controller.
     */
    static func instantiateFromStoryboard<T: ViewIdentifiable>(_ setup: ((T) -> Void)?) -> T {
        guard let viewController
            = reusableStoryboard.instantiateViewController(withIdentifier: T.identifier) as? T else {
                fatalError("Couldn't instantiate a view controller with identifier: \(T.identifier)")
        }

        setup?(viewController)

        return viewController
    }
    
}
