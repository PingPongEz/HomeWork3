//
//  username.swift
//  HomeWork3
//
//  Created by u on 21.03.2022.
//

import Foundation

struct UserNameData {
    
    var arrayOfUsers: [(String, String)] = []
    
    mutating func addUserWithName(_ name: String, andPass pass: String) {
        arrayOfUsers.append((name, pass))
        
    }
    
    func checkUserWithName(_ name: String,
                           andPass pass: String,
                           in array: [(String, String)]) -> Bool {
        for (username, password) in arrayOfUsers {
            print("Started")
            if username == name && password == pass {
                return true
            } 
        }
        return false
    }
    
    let person = SomePerson() 
}

struct SomePerson {
    let userName = "Sergey"
    let surname = "Veretennikov"
    let aboutUser = """
Сергей. 25 лет. Бездарность которая хочет стать великим человеком который сделает
самое лучшее приложение на планете. Но пока что у него плохо получается все это
потому что все на что он способен это тупить
"""
}

