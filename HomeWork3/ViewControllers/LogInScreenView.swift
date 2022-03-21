//
//  ViewController.swift
//  HomeWork3
//
//  Created by u on 17.03.2022.
//

import UIKit

var users = [(String, String)]()

class LogInScreenView: UIViewController {
    
    private let usernameData = UserNameData()

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    
    override func viewDidLoad() {
        userNameTF.delegate = self
        userPasswordTF.delegate = self
    }
    @IBAction func registerButtonPressed() {
    }
    
    @IBAction func logInButtonPressed() {
        
        guard let username = userNameTF.text else { alertForLogin(); return }
        guard let password = userPasswordTF.text else { alertForLogin(); return }
        
        for (user, pass) in usersInApp.arrayOfUsers {
            if user == username && pass == password {
                performSegue(withIdentifier: "logInDone", sender: nil)
            }
        }
        alertForLogin()

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
        let alertForUsername = UIAlertController(
            title: "Forgot?",
            message: "Einstein",
            preferredStyle: .alert
        )
        
        present(alertForUsername, animated: true)
        
        let okButtonForUserName = UIAlertAction(title: "OK",
                                                style: .default)
        
        alertForUsername.addAction(okButtonForUserName)
    }
    
    private func alertForPass() {       //Alert for password
        let alertForPass = UIAlertController(
            title: "Forgot?",
            message: "2281488",
            preferredStyle: .alert
        )
        
        present(alertForPass, animated: true)
        
        let okButtonForPass = UIAlertAction(title: "OK",
                                            style: .default)
        alertForPass.addAction(okButtonForPass)
    }
}


//MARK: Work with keyboard and touches
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
            performSegue(withIdentifier: "logInDone", sender: nil)
        }
        return true
    }
}


//MARK: Segues
extension LoggedInViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBar = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBar.viewControllers else { return }
        
        let user = UserDescription()
        
        for viewController in viewControllers {
            if let homePage = viewController as? LoggedInViewController {
                homePage.username = user.userName
            } else if let navigationController = viewController as? UINavigationController {
                if let aboutUser = navigationController.topViewController as? AboutMeViewController {
                    aboutUser.infoAboutMe = user.aboutUser
                }
            }
        }
    }
    
}
