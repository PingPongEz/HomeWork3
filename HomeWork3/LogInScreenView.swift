//
//  ViewController.swift
//  HomeWork3
//
//  Created by u on 17.03.2022.
//

import UIKit

class LogInScreenView: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    private let trueUserName = "Einstein"
    private let trueUserPass = "2281488"
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let username = segue.destination as? LoggedInViewController else { return }
        username.username = userNameTF.text
        
    }
    
    override func viewDidLoad() {
        userNameTF.delegate = self
        userPasswordTF.delegate = self
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text != trueUserName
            || userPasswordTF.text != trueUserPass {
            alertForLogin()
        }
    }
    @IBAction func forgotPasswordPressed() {
        alertForPass()
    }
    @IBAction func forgotUsernamePressed() {
        alertForUN()
    }
    
    @IBAction func logOutButton(_ unwindSegue: UIStoryboardSegue) {
        userNameTF.text = nil
        userPasswordTF.text = nil
    }
}


// MARK: Private Funcs Alerts
extension LogInScreenView {
    private func alertForLogin() {      //Alert For Login
        let alertForLogin = UIAlertController(title: "Wrong name or pass",
                                              message: "Try again",
                                              preferredStyle: .alert)
        
        present(alertForLogin, animated: true)
        
        let tryAgainButton = UIAlertAction(title: "Try again",
                                           style: .default) { _ in
            self.userPasswordTF.text = nil
        }
        
        alertForLogin.addAction(tryAgainButton)
    }
    
    private func alertForUN() {         //Alert for Username
        let alertForUsername = UIAlertController(title: "Forgot?",
                                                 message: "\(trueUserName)",
                                                 preferredStyle: .alert)
        
        present(alertForUsername, animated: true)
        
        let okButtonForUserName = UIAlertAction(title: "OK",
                                                style: .default)
        
        alertForUsername.addAction(okButtonForUserName)
    }
    
    private func alertForPass() {       //Alert for password
        let alertForPass = UIAlertController(title: "Forgot?",
                                             message: "\(trueUserPass)",
                                             preferredStyle: .alert)
        
        present(alertForPass, animated: true)
        
        let okButtonForPass = UIAlertAction(title: "OK",
                                            style: .default)
        alertForPass.addAction(okButtonForPass)
    }
}

extension LogInScreenView: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            userPasswordTF.becomeFirstResponder()
        } else {
            logInButtonPressed()
            performSegue(withIdentifier: "LoggedInViewController",
                         sender: nil)
        }
        return true
    }
}

