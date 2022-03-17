//
//  LogedInViewController.swift
//  HomeWork3
//
//  Created by u on 17.03.2022.
//

import UIKit

class LogedInViewController: UIViewController {
    
    var username: String!
    
    @IBOutlet private var hand: UILabel!
    @IBOutlet private var greetingOfUser: UILabel!
    @IBOutlet private var greetingHand: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingOfUser.text! += username
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
    
}
