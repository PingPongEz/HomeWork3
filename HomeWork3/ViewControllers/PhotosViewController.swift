//
//  PhotosViewController.swift
//  HomeWork3
//
//  Created by u on 20.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var myPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPhoto.layer.cornerRadius = 15
        //Хотелось бы понять как нормально скруглить углы у непропорциональной фотки
        //Да и в целом как работать с фото
    
    }
    

}
