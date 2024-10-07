//
//  UserDefaultsModel.swift
//  KREAM-Practice
//
//  Created by 허준호 on 10/5/24.
//

import Foundation

struct User: Codable{
    var email: String
    var password: String
}

class UserDefaultsModel {
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    public func setUserInfo(_ user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            userDefaults.set(encodedUser, forKey: "user")
        }
    }
    
    public func loadUserInfo() -> User? {
        var user: User?
        if let data = userDefaults.object(forKey: "user") as? Data{
            user = try? JSONDecoder().decode(User.self, from: data)
        }
        
        return user
    }
    
    public func removeUserInfo() {
        userDefaults.removeObject(forKey: "user")
    }
    
    public func updateUserEmail(_ email: String) {
        var user = loadUserInfo()
        user?.email = email
        if let user = user {
            setUserInfo(user)
        }
    }
    
    public func updateUserPassword(_ password: String) {
        var user = loadUserInfo()
        user?.password = password
        if let user = user {
            setUserInfo(user)
        }
    }
}
