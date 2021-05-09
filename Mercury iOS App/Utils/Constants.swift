import UIKit

struct Constants {
    
    struct ViewControllersIds {
        static let signUpViewController: String = "signUpViewController"
        static let homeViewController: String = "homeViewController"
        static let viewController: String = "viewController"
        static let tabBarController: String = "tabBarController"
        static let userProfileViewController: String = "userProfileViewController"
        static let initialScreenViewController: String = "initialScreenViewController"
    }
    
    struct TableViewsIds {
        static let cartItemCell: String = "cartItemCell"
    }
    
    struct Colors {
        static let principalRedBackground: UIColor = DesignHandler.getUIColorFromHex(0xB4272B)
    }
    
    struct UsersCollections{
        static let collectionName: String = "mercuryUsers"
        static let firstNameField: String = "firstName"
        static let uidField: String = "uid"
    }
    
    struct Network {
        static let port: String = "3000"
        static let host: String = "http://localhost"
    }
    
}
