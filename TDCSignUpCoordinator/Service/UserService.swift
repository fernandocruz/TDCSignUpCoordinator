//
//  UserService.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 14/04/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import Foundation

protocol UserService {
  func saveUser(_ userPayload: UserPayload, completion:(_ data: User?) -> Void)
  
  func getUser(completion:(_ data: User?) -> Void)
  
  func logout()
}
