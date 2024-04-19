//
//  UserDataManager.swift
//  WorkOut
//
//  Created by Alaster on 25.03.2024.
//

import Foundation


class UserDataManager {
    
    static let shared = UserDataManager()
    
    private var userDataArray: [UserData] = []
    
    
    
    
    func saveUserData(workName: String, approachTime: String, restTime: String ) {
        
       let userData = UserData(workName: workName , approachTime: approachTime, restTime: restTime)
        userDataArray.append(userData)
        
        
        
    }
    
    func getUserDataArray() -> [UserData] {
            return userDataArray
        }
    
}
