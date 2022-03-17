//
//  ViewController.swift
//  HomeWork3
//
//  Created by u on 17.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let trueUserName = "Einstein"
    let trueUserPass = "2281488"
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let username = segue.destination as? LogedInViewController else { return }
        username.username = userNameTF.text
    }
    
    @IBAction func logInButtonPressed() {
        if userNameTF.text != trueUserName || userPasswordTF.text != trueUserPass {
            alertForLogin()
        }
    }
    @IBAction func forgotPasswordPressed() {
        alertForPass()
    }
    @IBAction func forgotUsernamePressed() {
        alertForUN()
    }
    
    @IBAction func logOutButton(for segue: UIStoryboardSegue) {
        userNameTF.text = nil
        userPasswordTF.text = nil
    }
}


// MARK: Private Funcs Alerts
extension ViewController {
    private func alertForLogin() {      //Alert For Login
        let alertForLogin = UIAlertController(title: "Wrong name or pass",
                                              message: "Try again",
                                              preferredStyle: .alert)
        
        present(alertForLogin, animated: true)
        
        let tryAgainButton = UIAlertAction(title: "Try again",
                                           style: .default)
        
        alertForLogin.addAction(tryAgainButton)
    }
    
    private func alertForUN() {         //Alert for Username
        let alertForUsername = UIAlertController(title: "Forgot?",
                                                 message: "Einstein",
                                                 preferredStyle: .alert)
        
        present(alertForUsername, animated: true)
        
        let okButtonForUserName = UIAlertAction(title: "OK",
                                                style: .default)
        
        alertForUsername.addAction(okButtonForUserName)
    }
    
    private func alertForPass() {       //Alert for password
        let alertForPass = UIAlertController(title: "Forgot?",
                                             message: "2281488",
                                             preferredStyle: .alert)
        
        present(alertForPass, animated: true)
        
        let okButtonForPass = UIAlertAction(title: "OK",
                                            style: .default)
        alertForPass.addAction(okButtonForPass)
    }
}
