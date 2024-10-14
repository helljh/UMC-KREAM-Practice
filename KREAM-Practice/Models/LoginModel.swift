import Foundation

struct LoginModel {
    var email: String
    var password: String
    private let userDefaults = UserDefaults.standard
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    public func setEmail(_ email: String) {
        userDefaults.set(email, forKey: "email")
    }
    
    public func setPassword(_ password: String) {
        userDefaults.set(password, forKey: "password")
    }
    
    public func loadEmail() -> String? {
        let email = userDefaults.string(forKey: "email")
        return email
    }
    
    public func loadPassword() -> String? {
        let password = userDefaults.string(forKey: "password")
        return password
    }
    
}
