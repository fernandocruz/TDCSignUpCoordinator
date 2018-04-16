//
//  HomeCoordinator.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 08/04/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol HomeCoordinatorDelegate: class {
  func logout()
}

class HomeCoordinator: Coordinator {
  
  let window: UIWindow
  let navigationController: UINavigationController
  
  let user: User
  
  weak var delegate: HomeCoordinatorDelegate?
  
  init(window: UIWindow,
       navigationController: UINavigationController = UINavigationController(),
       user: User) {
    
    self.window = window
    self.navigationController = navigationController
    self.user = user
  }
  
  func start() {
    showHomeView(user: self.user)
  }
  
  private func showHomeView(user: User) {
    let view = HomeView(user: self.user)
    view.delegate = self
    self.window.rootViewController = view
  }

}

extension HomeCoordinator: HomeViewDelegate {
  func logout() {
    self.delegate?.logout()
  }
  
}
