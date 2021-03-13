import UIKit
extension UIView {
    var snapshot: UIImage {
        return UIGraphicsImageRenderer(bounds: bounds).image { render in
            layer.render(in: render.cgContext)
        }
    }
}
