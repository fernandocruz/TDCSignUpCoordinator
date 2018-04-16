//
//  UserServiceImpl.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 14/04/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import Foundation

struct UserServiceImpl: UserService {

  let userDefaults: UserDefaults
  
  init(userDefaults: UserDefaults = UserDefaults.standard) {
    self.userDefaults = userDefaults
  }
  
  func saveUser(_ userPayload: UserPayload, completion:(_ data: User?)-> Void) {
    guard let user = parseToUser(userPayload) else {
      completion(nil)
      return
    }
    
    let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: user)
    userDefaults.set(encodedData, forKey: "user")
    userDefaults.synchronize()
    
    completion(user)
  }
  
  func getUser(completion:(_ data: User?)-> Void) {
    if let decoded  = userDefaults.object(forKey: "user") as? Data {
      let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
      completion(decodedUser)
    } else {
      completion(nil)
    }
  }
  
  func logout() {
    userDefaults.removeObject(forKey: "user")
  }
  
}

extension UserServiceImpl {
  private func parseToUser(_ userPayload: UserPayload) -> User? {
    
    guard let name = userPayload.name,
      let email = userPayload.email else {
      return nil
    }
    return User(name: name, email: email)
  }
}
