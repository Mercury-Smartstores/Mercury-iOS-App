import UIKit

class TicketsViewController: UIViewController {
    @IBOutlet weak var ticketsTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        ticketsTitleTextField.backgroundColor = .clear
        ticketsTitleTextField.textColor = .white
        ticketsTitleTextField.isUserInteractionEnabled = false
    }
}
