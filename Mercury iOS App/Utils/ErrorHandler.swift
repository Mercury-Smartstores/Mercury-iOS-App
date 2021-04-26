import Foundation
import UIKit

class ErrorHandler {
    
    static func showError(_ errorLabel: UILabel!, _ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
}
