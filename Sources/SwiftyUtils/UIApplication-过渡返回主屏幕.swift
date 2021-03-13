extension UIApplication {
    func suspend() {
        let app = shared
        let selector = NSSelectorFromString("suspend")
        app.perform(selector, with: app, with: selector)
    }
}
