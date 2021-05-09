import Foundation
import UIKit

class DesignHandler {
    
    static func getUIColorFromHex(_ hexValue: Int) -> UIColor! {
        return UIColor(
            red: CGFloat((Float((hexValue & 0xff0000) >> 16)) / 255.0),
            green: CGFloat((Float((hexValue & 0x00ff00) >> 8)) / 255.0),
            blue: CGFloat((Float((hexValue & 0x0000ff) >> 0)) / 255.0),
            alpha: 1.0)
    }
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton, _ backgroundColor:UIColor, _ tintColor:UIColor) {
        // Filled rounded corner style
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 25.0
        button.tintColor = tintColor
    }
    
    static func styleHollowButton(_ button:UIButton) {
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
}
