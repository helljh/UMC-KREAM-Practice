//
//  KeyChainHandler.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/16/24.
//

import Foundation
import Security

class KeyChainHelper {
    
    static let serviceName = "kakaologin"
    
    @discardableResult
    static func create(token: String, forAccount account: String) -> Bool {
        
        let keychainItem = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecAttrService: serviceName,
            kSecValueData: token.data(using: .utf8) as Any
        ] as [String:Any]
        
        let status = SecItemAdd(keychainItem as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Keychain create Error")
            return false
        }
        return true
    }
    
    static func read(forService serviceName: String) -> String? {
        let keychainQuery = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: serviceName,
                kSecReturnAttributes: true,  // 속성을 반환하도록 요청
                kSecMatchLimit: kSecMatchLimitOne  // 첫 번째 항목만 반환
            ] as [String: Any]
            
            var item: CFTypeRef?
            let status = SecItemCopyMatching(keychainQuery as CFDictionary, &item)
            
            if status == errSecSuccess {
                if let attributes = item as? [CFString: Any],
                   let account = attributes[kSecAttrAccount] as? String {
                    return account
                }
            }
            
            if status == errSecItemNotFound {
                print("No account found in keychain for service: \(serviceName)")
            } else {
                print("Error retrieving account from keychain: \(status)")
            }
            
            return nil
    }
    
    @discardableResult
    static func delete(forAccount account: String) -> Bool{
        let keychainItem = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: serviceName,
            kSecAttrAccount: account
        ] as [String: Any]
        
        let status = SecItemDelete(keychainItem as CFDictionary)
        guard status != errSecItemNotFound else {
            print("The token was not found in keychain")
            return false
        }
        guard status == errSecSuccess else {
            print("Keychain delete Error")
            return false
        }
        print("The token in keychain is deleted")
        return true
    }
}
