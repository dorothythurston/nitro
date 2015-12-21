import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setContinueButtonState()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        passwordTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressContinueButton() {
        //login
    }
    
    func setContinueButtonState() {
        continueButton.enabled = fieldsAreValid()
    }
    
    func textFieldDidChange(textField: UITextField) {
        setContinueButtonState()
    }
    
    private func fieldsAreValid() -> Bool {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        return email.isValidEmailFormat() && password.isValidPasswordFormat()
    }
}