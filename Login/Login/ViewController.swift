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
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonConfiguration()
    }
    
    private func setButtonConfiguration() {
        loginButton.layer.cornerRadius = 6
        loginButton.layer.shadowColor = UIColor.systemBlue.cgColor
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonAction(_ sender: Any) {
        print("login button was push")
    }
    
    @IBAction func signHereButtonAction(_ sender: Any) {
        print("sign here button was push")
    }
    
}

