func gotoHome() {
    let app = UIApplication.shared
    let selector = NSSelectorFromString("suspend")
    app.perform(selector, with: app, with: selector)
}