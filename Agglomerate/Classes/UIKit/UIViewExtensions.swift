extension UIView {

    func addInterpolatingMotionEffects(minimaxRelativeValue: Double = 10) {
        _ = NotificationCenter.default.addObserver(forName: NSNotification.Name
            .UIAccessibilityReduceMotionStatusDidChange,
                                                   object: self, queue: nil) { [weak self] _ in
                                                    if UIAccessibilityIsReduceMotionEnabled() {
                                                        self?.removeMotions()
                                                    } else {
                                                        self?.addInterpolatingMotionEffects(minimaxRelativeValue: minimaxRelativeValue)
                                                    }
        }
        
        let motionX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        let motionY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        
        motionX.minimumRelativeValue = -minimaxRelativeValue
        motionX.maximumRelativeValue = minimaxRelativeValue
        motionY.minimumRelativeValue = -minimaxRelativeValue
        motionY.maximumRelativeValue = minimaxRelativeValue
        
        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [motionX, motionY]
        
        if !UIAccessibilityIsReduceMotionEnabled() {
            addMotionEffect(effectGroup)
        }
    }
    
    /// Removes all motion effects from `self`.
    func removeMotions() {
        motionEffects = []
    }
    
    /// Returns height of view if given fixed width.
    ///
    /// - Parameter width: Width.
    /// - Returns: Height.
    func heightForWidth(_ width: CGFloat) -> CGFloat {
        return sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)).height
    }
    
    /// Calculate the height given the current frame width
    var heightForFrameWidth: CGFloat {
        return heightForWidth(frame.width)
    }
    
    var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let wholeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return wholeImage
    }
    
    /// Animates each keyframe equally over the course of the duration.
    ///
    /// If you pass in 10 animations and a duration of 10 seconds, the first animation will be delayed 0/10s and run 1/10s,
    /// the second will be delay 1/10s and run 1/10s, …, the nth will be delayed n/10 and run 1/10 until 9/10 lasting 1/10
    /// seconds.
    ///
    /// If you pass 5 animations and a duration of 10 seconds, the first animation will be delayed 0/5s and run 1/5s,
    /// the second will be delay 1/5s and run 1/10s, …, the nth will be delayed n/5 and run 1/5 until 4/5 lasting 1/5
    /// seconds.
    ///
    /// So it’s useful for saying “this group of animations will run 2 seconds and there are 5 different things I want you
    /// to do one after the other, work out how to schedule them and how long they last because that’s hard work I don’t
    /// want to think about.”
    ///
    ///  0   1               5                  10
    ///  |---|---|---|---|---|---|---|---|---|---|
    ///  111111111
    ///          222222222
    ///                  333333333
    ///                          444444444
    ///                                  555555555
    ///
    /// - Parameters:
    ///   - duration: How long for the whole animation?
    ///   - delay: How long to wait until starting the animation?
    ///   - options: See options documentation in UIKit
    ///   - keyframes: An array of animation closures, length determines duration of each animation (1/n)
    ///   - completion: See completion documentation in UIKit.
    class func animateKeyframes(withTotalDuration duration: TimeInterval,
                                delay: TimeInterval = 0,
                                options: UIViewKeyframeAnimationOptions = [],
                                keyframes: [() -> Void],
                                completion: ((Bool) -> Void)? = nil) {
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: [], animations: {
            var animationIndex: TimeInterval = 0
            keyframes.forEach {
                UIView.addKeyframe(withRelativeStartTime: animationIndex / TimeInterval(keyframes.count),
                                   relativeDuration: 1 / duration,
                                   animations: $0)
                animationIndex += 1
            }
        }, completion: completion)
    }
    
    /// Use this to do the same thing as `animateKeyframes(withTotalDuration:)`, but instead of specifying
    /// a total duration for each animation to share and divide between them, you can specify the duration
    /// of _each_ animation, meaning that the first will last the duration, the second will last the duration,
    /// etc, and the total duration will equal the duration multiplied by the number of keyframes.
    ///
    /// - Parameters:
    ///   - duration: the length of each animation
    ///   - delay: How long to wait until starting the animation?
    ///   - options: See options documentation in UIKit
    ///   - keyframes: An array of animation closures, length determines duration of each animation (1/n)
    ///   - completion: See completion documentation in UIKit.
    class func animateKeyframes(eachWithDuration duration: TimeInterval,
                                delay: TimeInterval = 0,
                                options: UIViewKeyframeAnimationOptions = [],
                                keyframes: [() -> Void],
                                completion: ((Bool) -> Void)? = nil) {
        let keyframeCount = TimeInterval(keyframes.count)
        UIView.animateKeyframes(withDuration: duration * keyframeCount, delay: delay, options: [], animations: {
            var animationIndex: TimeInterval = 0
            keyframes.forEach {
                UIView.addKeyframe(withRelativeStartTime: animationIndex / keyframeCount,
                                   relativeDuration: duration,
                                   animations: $0)
                animationIndex += 1
            }
        }, completion: completion)
    }

}
