import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var startShoppingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        NotificationCenter.default.addObserver(self, selector: #selector(self.clientExitedShop), name: NSNotification.Name(rawValue: Constants.Notifications.clientExit), object: nil)
    }
    
    @objc func clientExitedShop(_ notification: NSNotification) {
        startShoppingButton.isEnabled = true
    }
    
    func setUpElements() {
        startShoppingButton.center = self.view.center
        startShoppingButton.setTitle("You're in!", for: UIControl.State.disabled)
        startShoppingButton.setTitle("Start shopping", for: UIControl.State.normal)
        titleTextField.textColor = .white
        titleTextField.backgroundColor = .clear
        titleTextField.isUserInteractionEnabled = false
        DesignHandler.styleFilledButton(startShoppingButton, DesignHandler.getUIColorFromHex(0xBF474A), UIColor.white)
        view.bringSubviewToFront(startShoppingButton)
        let background = UIImage(named: "market.jpeg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        imageView.alpha = 0.2
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error at logging out: \(error)")
            return
        }
    }
    
    @IBAction func startShoppingTapped(_ sender: Any) {
        self.startShoppingButton.isEnabled = false
        Client.shared.socket.connect()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: Constants.Notifications.clientEnteredShop), object: nil)
        if let tabBarController = self.view.window!.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = 1
        }
    }
    
}

