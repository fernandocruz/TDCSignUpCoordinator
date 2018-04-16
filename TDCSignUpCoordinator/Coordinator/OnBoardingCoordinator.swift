//
//  OnBoardingCoordinator.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 08/04/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol OnBoardingCoordinatorDelegate: class {
  func onSignUpCompleted(_ userPayload: UserPayload)
}

class OnBoardingCoordinator: Coordinator {
  
  let window: UIWindow
  let navigationController: UINavigationController
  
  weak var delegate: OnBoardingCoordinatorDelegate?
  
  var signUpCoordinator: SignUpCoordinator?
  
  init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
    self.window = window
    self.navigationController = navigationController
    self.navigationController.navigationBar.isHidden = true
  }
  
  func start() {
    self.showOnboardingView()
  }
  
  private func showOnboardingView() {
    let view = OnBoardingView()
    view.delegate = self
    self.navigationController.viewControllers = [view]
    self.window.rootViewController = navigationController
  }
  
  private func showSignUp() {
    self.signUpCoordinator = SignUpCoordinator(navigationController: self.navigationController)
    self.signUpCoordinator?.delegate = self
    self.signUpCoordinator?.start()
  }
}

extension OnBoardingCoordinator: OnBoardingViewDelegate {
  func onSignUpButtonTapped() {
    showSignUp()
  }
}

extension OnBoardingCoordinator: SignUpCoordinatorDelegate {
  func onSignUpCompleted(_ userPayload: UserPayload) {
    self.delegate?.onSignUpCompleted(userPayload)
  }
}
