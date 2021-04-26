import Foundation
import UIKit

class ViewTransition {
    
    static func transitionTo(_ window: UIWindow?, _ storyboard: UIStoryboard!, _ viewControllerId: String) {
        window?.rootViewController = storyboard?.instantiateViewController(identifier: viewControllerId)
        window?.makeKeyAndVisible()
    }
    
}
