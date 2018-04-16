//
//  AppCoordinator.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
  
  let window: UIWindow
  
  let service: UserService
  
  var onBoardingCoordinator: OnBoardingCoordinator?
  var homeCoordinator: HomeCoordinator?
  
  init(window: UIWindow, service: UserService) {
    self.window = window
    self.service = service
  }
  
  func start() {
    service.getUser { userStored in
      if let userStored = userStored {
        showHome(userStored)
      } else {
        showOnBoarding()
      }
    }
  }
  
  private func showOnBoarding() {
    self.onBoardingCoordinator = OnBoardingCoordinator(window: self.window)
    self.onBoardingCoordinator?.delegate = self
    self.onBoardingCoordinator?.start()
  }
  
  private func showHome(_ user: User) {
    self.homeCoordinator = HomeCoordinator(window: self.window, user: user)
    self.homeCoordinator?.delegate = self
    self.homeCoordinator?.start()
  }
  
}

extension AppCoordinator: OnBoardingCoordinatorDelegate {
  func onSignUpCompleted(_ userPayload: UserPayload) {
    
    self.service.saveUser(userPayload) { userStored in
      if let userStored = userStored {
        showHome(userStored)
      }
    }
  }
}

extension AppCoordinator: HomeCoordinatorDelegate {
  func logout() {
    self.service.logout()
    showOnBoarding()
  }
  
  
}
