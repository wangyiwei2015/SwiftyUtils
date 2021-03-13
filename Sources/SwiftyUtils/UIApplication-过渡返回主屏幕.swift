import UIKit
extension UIApplication {
    /**
     Suspends the application with animation.
     */
    func suspend() {
        let app = UIApplication.shared
        let selector = NSSelectorFromString("suspend")
        app.perform(selector, with: app, with: selector)
    }
    
    /**
     Quits the application with animation.
     */
    func exitAnimated(_ code: Int32) {
        let app = UIApplication.shared
        let selector = NSSelectorFromString("suspend")
        app.perform(selector, with: app, with: selector)
        exit(code)
    }
}
