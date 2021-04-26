import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var appLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.backgroundColor = Constants.Colors.principalRedBackground
        DesignHandler.styleTextField(emailTextField)
        DesignHandler.styleTextField(passwordTextField)
        DesignHandler.styleFilledButton(logInButton)
    }
    
    /**
     Check the fields and validate that the data introduced is correct. Otherwise, it returns the error message.
     */
    func checkFields() -> Bool {
        if FieldValidation.isTextfieldEmpty(emailTextField) ||
            FieldValidation.isTextfieldEmpty(passwordTextField) {
            ErrorHandler.showError(errorLabel, "Please fill in all fields")
            return false
        }
        if !FieldValidation.isValidEmail(emailTextField.text!){
            ErrorHandler.showError(errorLabel, "Invalid email address")
            return false
        }
        if !FieldValidation.isPasswordValid(passwordTextField.text!) {
            ErrorHandler.showError(errorLabel, "Incorrect password format")
            return false
        }
        return true
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        if checkFields() {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, err) in
                if err != nil {
                    ErrorHandler.showError(self.errorLabel, err!.localizedDescription)
                }
                else{
                    ViewTransition.transitionTo(self.view.window, self.storyboard, Constants.ViewControllersIds.tabBarController)
                }
            }
        }
    }
}
