extension UIView {
    func addBlur(alpha: CGFloat, style: UIBlurEffect.Style) {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blur.frame = CGRect(origin: .zero, size: self.frame.size)
        blur.alpha = alpha
        self.addSubview(blur)
        self.sendSubviewToBack(blur)
        blur.isUserInteractionEnabled = false
    }
}