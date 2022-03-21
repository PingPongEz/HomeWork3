//
//  RegisterViewController.swift
//  HomeWork3
//
//  Created by u on 21.03.2022.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private var registerPasswordTF: UITextField!
    @IBOutlet private var registerUsernameTF: UITextField!

    @IBAction private func registerDonePressed() {
        
        
        guard let newUsername = registerUsernameTF.text else { return }
        guard let newPassword = registerPasswordTF.text else { return }
        
        if !newUsername.isEmpty && !newPassword.isEmpty {
            
            usersInApp.addUserWithName(newUsername, andPass: newPassword)
            
        } else {
            print("You can't register empty name or password")
        }
        dismiss(animated: true, completion: nil)
    }
}
