import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userProfileButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        userProfileButton.tintColor = .white
    }

}
