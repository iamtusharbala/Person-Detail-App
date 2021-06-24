//
//  Details.swift
//  Task Detail App
//
//  Created by Coditas on 09/06/21.
//

import Foundation

struct Data: Codable {
    let id : Int
    let email : String
    let firstName : String
    let lastName : String
    let avatarImage : String
    
    init(idDetail : Int, emailDetail : String, fnameReceived : String, lnameReceived : String , imageReceived : String) {
        id  = idDetail
        email = emailDetail
        firstName = fnameReceived
        lastName = lnameReceived
        avatarImage = imageReceived
    }
}
