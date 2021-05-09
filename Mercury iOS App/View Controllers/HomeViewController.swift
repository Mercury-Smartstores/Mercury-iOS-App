import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var startShoppingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        startShoppingButton.center = self.view.center
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
        }
    }
}
