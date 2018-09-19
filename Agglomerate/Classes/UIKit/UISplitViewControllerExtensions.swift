public extension UISplitViewController {
    public func detailViewController<T: UIViewController>() -> T? {
        if viewControllers.indices.contains(1) {
            if let viewController = viewControllers[1] as? T {
                return viewController
            } else if let navigationController = viewControllers[1] as? UINavigationController,
                let viewController = navigationController.viewControllers.first as? T {
                return viewController
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
