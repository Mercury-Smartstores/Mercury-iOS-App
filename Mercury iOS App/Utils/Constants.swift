import UIKit

struct Constants {
    
    struct ViewControllersIds {
        static let signUpViewController: String = "signUpViewController"
        static let homeViewController: String = "homeViewController"
        static let viewController: String = "viewController"
        static let tabBarController: String = "tabBarController"
    }
    
    struct Colors {
        static let principalRedBackground: UIColor = DesignHandler.getUIColorFromHex(0xB4272B)
    }
    
    struct UsersCollections{
        static let collectionName: String = "mercuryUsers"
        static let firstNameField: String = "firstName"
        static let uidField: String = "uid"
    }
    
}
