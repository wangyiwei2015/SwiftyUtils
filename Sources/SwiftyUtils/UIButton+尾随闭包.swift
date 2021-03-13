import UIKit
extension UIButton {
    struct AssociatedClosureClass {
        var eventClosure: (UIButton)->()
    }
    
    private struct AssociatedKeys {
        static var eventClosureObj:AssociatedClosureClass?
    }
    
    private var eventClosureObj: AssociatedClosureClass{
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.eventClosureObj, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            return (objc_getAssociatedObject(self, &AssociatedKeys.eventClosureObj) as? AssociatedClosureClass)!
        }
    }
    
    /**
     Adds a target to the button.
     - parameter controlEvents: event to trigger the target
     - parameter action: the action closure
     */
    func addTarget(for controlEvents: UIControl.Event, action:@escaping (UIButton)->()) {
        let eventObj = AssociatedClosureClass(eventClosure: action)
        eventClosureObj = eventObj
        addTarget(self, action: #selector(eventExcuate(_:)), for: controlEvents)
    }
    
    @objc private func eventExcuate(_ sender: UIButton){
        eventClosureObj.eventClosure(sender)
    }
}
