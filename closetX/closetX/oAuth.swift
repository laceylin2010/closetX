//
//  oAuth.swift
//  closetX
//
//  Created by Lauren Spatz on 4/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

typealias OAuthCompletion = (success: Bool) -> ()

enum Errors: ErrorType
{
    case MissingToken(String)
    case ResponseFromClosetX
}


class OAuth {
    let kAccessTokenKey = "kAccessTokenKey"
    
    
    static let shared = OAuth()
    private init () {}
    
    func loginToApp(username: String, password: String, completion: OAuthCompletion)
    {
        let urlPath = "https://closetx.herokuapp.com/api/login"
        let url = NSURL(string: urlPath)
        let request = NSMutableURLRequest(URL: url!)
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData = loginString.dataUsingEncoding(NSUTF8StringEncoding)
        let base64LoginString = loginData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions())
        request.HTTPMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        print(base64LoginString)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                return
            } else {
                print(request)
            }
            
            let response = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(response)
            do {
                if let convertingJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    print(convertingJSON)
                    if let token = convertingJSON["token"] as? String{
                        OAuth.shared.saveAccessTokenToKeychain(token)
                        print("login saved")
                        NSOperationQueue.mainQueue().addOperationWithBlock({ 
                             completion(success: true)
                        })
                        
                    }
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(success: false)
            }
        }
        
        task.resume()
        
    }
    
    private func getTokenFromKeychain() -> String?
    {
        var keychainQuery = self.getKeychainQuery(kAccessTokenKey)
        keychainQuery[(kSecReturnData as String)] = kCFBooleanTrue
        keychainQuery[(kSecMatchLimit as String)] = kSecMatchLimitOne
        var dataReference: AnyObject?
        
        if SecItemCopyMatching(keychainQuery, &dataReference) == noErr{
            if let data = dataReference as? NSData {
                if let token = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? String{
                    return token
                }
            }
        }
        return nil
    }
    
    func getKeychainQuery(query: String) -> [String: AnyObject]
    {
        return[
            (kSecClass as String) : kSecClassGenericPassword,
            (kSecAttrService as String) : query,
            (kSecAttrAccount as String) : query,
            (kSecAttrAccessible as String) : kSecAttrAccessibleAfterFirstUnlock]
    }
    
    
    
   func saveAccessTokenToKeychain(token: String)-> Bool
    {
        var keychainQuery = self.getKeychainQuery(kAccessTokenKey)
        keychainQuery[(kSecValueData as String)] = NSKeyedArchiver.archivedDataWithRootObject(token)
        SecItemDelete(keychainQuery)
        return SecItemAdd(keychainQuery, nil) == errSecSuccess
        
    }
    
    
    func accessToken() throws -> String
    {
        var accessToken: String?
        if let token = self.getTokenFromKeychain(){
            accessToken = token
        }
        guard let token = accessToken else{
            throw Errors.MissingToken("Token not Saved")}
        return token
    }
}


































