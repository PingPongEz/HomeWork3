//
//  RegisterViewController.swift
//  HomeWork3
//
//  Created by u on 21.03.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private var registerUsernameTF: UITextField!
    @IBOutlet private var registerPasswordTF: UITextField!

    override func viewDidLoad() {
        registerUsernameTF.delegate = self
        registerPasswordTF.delegate = self
    }

    @IBAction private func registerDonePressed() {
        
        
        guard let newUsername = registerUsernameTF.text else { return }
        guard let newPassword = registerPasswordTF.text else { return }
        
        if !newUsername.isEmpty && !newPassword.isEmpty {
            
            usersInApp.addUserWithName(newUsername, andPass: newPassword)
            print(usersInApp.arrayOfUsers)
            
        } else {
            print("You can't register empty name or password")
            return
        }
        dismiss(animated: true, completion: nil)
    }
    
}

//MARK: Work with keyboard and touches
extension RegisterViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == registerUsernameTF {
            registerPasswordTF.becomeFirstResponder()
        } else {
            registerDonePressed()
        }
        return true
    }
}
