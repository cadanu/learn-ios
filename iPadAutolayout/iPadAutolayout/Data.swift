//
//  Data.swift
//  iPadAutolayout
//
//  Created by GDJ on 2023-02-17.
//

import UIKit

class Data: NSObject {
    
    var saveName: String?
    var saveEmail: String?
    
    override init() {
//        saveName = "Full Name"
//        saveEmail = "fname@mail.com"
    }
    
    func initWithData(_name: String, _email: String) {
        saveName = _name
        saveEmail = _email
    }

}
