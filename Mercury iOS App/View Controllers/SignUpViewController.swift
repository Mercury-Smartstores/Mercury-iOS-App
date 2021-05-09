import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        firstNameTextField.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.backgroundColor = Constants.Colors.principalRedBackground
        DesignHandler.styleTextField(firstNameTextField)
        DesignHandler.styleTextField(lastNameTextField)
        DesignHandler.styleTextField(emailTextField)
        DesignHandler.styleTextField(passwordTextField)
        DesignHandler.styleFilledButton(signUpButton, UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), UIColor.white)
    }
    
    /**
     Check the fields and validate that the data introduced is correct. Otherwise, it returns the error message.
     */
    func checkFields() -> Bool {
        if FieldValidation.isTextfieldEmpty(firstNameTextField) ||
            FieldValidation.isTextfieldEmpty(lastNameTextField) ||
            FieldValidation.isTextfieldEmpty(emailTextField) ||
            FieldValidation.isTextfieldEmpty(passwordTextField) {
            ErrorHandler.showError(errorLabel, "Please fill in all fields")
            return false
        }
        if !FieldValidation.isValidEmail(emailTextField.text!){
            ErrorHandler.showError(errorLabel, "Invalid email address")
            return false
        }
        if !FieldValidation.isPasswordValid(passwordTextField.text!) {
            ErrorHandler.showError(errorLabel, "Your password must contain at least 8 characters, an special character and a number")
            return false
        }
        return true
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Validate the fields
        if checkFields() {
            // Create the user
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, err) in
                if err != nil {
                    ErrorHandler.showError(self.errorLabel, "A problem occurred while creating the user")
                }
                else {
                    let db = Firestore.firestore()
                    db.collection(Constants.UsersCollections.collectionName).addDocument(data: [Constants.UsersCollections.firstNameField: self.firstNameTextField.text!,
                                                                                                Constants.UsersCollections.uidField: result!.user.uid]) { (error) in
                        if error != nil {
                            ErrorHandler.showError(self.errorLabel, "Error while adding user to collection")
                        } else {
                            // Transition to home screen
                            ViewTransition.transitionTo(self.view.window, self.storyboard, Constants.ViewControllersIds.tabBarController)
                        }
                    }
                }
                
            }
        }
    }

}
