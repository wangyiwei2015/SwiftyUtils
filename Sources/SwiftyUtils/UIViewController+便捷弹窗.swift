import UIKit
extension UIViewController {
    struct AlertButton {
        let title: String? = nil
        let style: UIAlertAction.Style = .cancel
        let handler: ((UIAlertAction, [UITextField])->Void)? = nil
    }
    
    /**
     Configurates and shows the alert.
     - parameter title: default nil
     - parameter message: default nil
     - parameter style: default .alert
     - parameter textFieldTexts: \[placeholder : filled text\], default empty
     - parameter buttons: default empty
     - parameter completion: default nil
     */
    func alert(
        title: String? = nil,
        message: String? = nil,
        style: UIAlertController.Style = .alert,
        textFieldTexts: [String? : String?] = [:],
        buttons: [AlertButton] = [],
        completion: (()->Void)? = nil
    ) {
        var nonNilTitle = title
        if title == nil && message == nil {
            nonNilTitle = ""
        }
        let alert = UIAlertController(title: nonNilTitle, message: message, preferredStyle: style)
        for text in textFieldTexts {
            alert.addTextField(configurationHandler: {field in
                field.text = text.key
                field.placeholder = text.value
            })
        }
        for button in buttons {
            alert.addAction(UIAlertAction(title: button.title, style: button.style, handler: {action in
                button.handler?(action, alert.textFields ?? [])
            }))
        }
        self.present(alert, animated: true, completion: completion)
    }
}
