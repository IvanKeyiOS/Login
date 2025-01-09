//
//  ViewController.swift
//  Login
//
//  Created by Иван Курганский on 06/01/2025.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var lineUnderEmailView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var lineUnderPasswordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signHereButton: UIButton!
    @IBOutlet weak var doNotHaveAccountLabel: UILabel!
    @IBOutlet weak var envelopImageView: UIImageView!
    @IBOutlet weak var lockImageView: UIImageView!
    
    //MARK: - Properties
    private let activeColor = UIColor(named: "notes") ?? UIColor.gray
    private var email: String = "" {
        didSet {
            turnButtonLoginOn()
        }
    }
    
    private var password: String = "" {
        didSet {
            turnButtonLoginOn()
        }
    }
    
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "12345678"
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonConfiguration()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
    }
    
    private func setButtonConfiguration() {
        loginButton.layer.cornerRadius = 6
        loginButton.layer.shadowColor = activeColor.cgColor
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 8)
        loginButton.layer.shadowRadius = 8
        
        loginButton.isUserInteractionEnabled = false
        loginButton.backgroundColor = .systemGray5
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonAction(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        if email == mockEmail, password == mockPassword {
            performSegue(withIdentifier: "GoToSecond", sender: sender)
        } else {
            let alert = UIAlertController(title: String(localized: "Error"),
                                          
                                          message: String(localized: "Wrong password or e-mail"),
                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: String(localized: "OK"), style: .default)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func signHereButtonAction(_ sender: Any) {
        print("sign here button was push")
        performSegue(withIdentifier: "GoToSignup", sender: sender)

    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !text.isEmpty else { return }
        
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            if isValidEmail {
                email = text
                envelopImageView.tintColor = activeColor
                lineUnderEmailView.backgroundColor = activeColor
            } else {
                email = ""
                makeErrorField(textField: textField)
            }
        case passwordTextField:
            let isValidPassword = check(password: text)
            if isValidPassword {
                password = text
                lockImageView.tintColor = activeColor
                lineUnderPasswordView.backgroundColor = activeColor
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("unknown textField")
        }
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 7
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopImageView.tintColor = .systemGray5
            lineUnderEmailView.backgroundColor = .systemGray5
        case passwordTextField:
            lockImageView.tintColor = .systemGray5
            lineUnderPasswordView.backgroundColor = .systemGray5
        default:
            print("unknown textField")
        }
    }
    
    private func turnButtonLoginOn() {
        loginButton.backgroundColor = !(email == mockEmail && password == mockPassword) ? .systemGray5 :  activeColor
        loginButton.isUserInteractionEnabled = (email == mockEmail && password == mockPassword)
    }
}
