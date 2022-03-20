//
//  AboutMeViewController.swift
//  HomeWork3
//
//  Created by u on 20.03.2022.
//

import UIKit

class AboutMeViewController: UIViewController {

    var infoAboutMe: String?
    
    @IBOutlet var aboutMe: UILabel!
    
    override func viewDidLoad() {
        aboutMe.text = infoAboutMe ?? "No info about this user"
    }

}
