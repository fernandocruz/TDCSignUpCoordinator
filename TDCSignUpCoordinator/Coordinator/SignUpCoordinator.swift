//
//  SignUpCoordinator.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit


struct UserPayload {
  var country: String? = nil
  var email: String? = nil
  var password: String? = nil
  var cpf: String? = nil
  var name: String? = nil
}

enum Steps {
  case country
  case email
  case password
  case cpf
  case name
}

protocol SignUpCoordinatorDelegate: class {
  func onSignUpCompleted(_ userPayload: UserPayload)
}

class SignUpCoordinator: Coordinator {
  
  let navigationController: UINavigationController
  
  weak var delegate: SignUpCoordinatorDelegate?
  
  var userPayload: UserPayload?
  var currentStep: Steps?
  
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
    self.navigationController.navigationBar.isHidden = false

    self.userPayload = UserPayload()
  }
  
  func start() {
    showCountryView()
  }
  
  private func showCountryView() {
    let view = GenericView()
    view.delegate = self
    view.currentStep = .country
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showEmailView() {
    let view = GenericView()
    view.delegate = self
    view.currentStep = .email
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showPasswordView() {
    let view = GenericView()
    view.delegate = self
    view.currentStep = .password
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showCPFView() {
    let view = GenericView()
    view.delegate = self
    view.currentStep = .cpf
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showNameView() {    
    let view = GenericView()
    view.delegate = self
    view.currentStep = .name
    self.navigationController.pushViewController(view, animated: true)
  }
  
}

extension SignUpCoordinator: GenericViewDelegate {
  func onButtonTapped(data: String, currentStep: Steps) {
      switch currentStep {
      case .country:
        userPayload?.country = data
        showEmailView()
      case .email:
        userPayload?.email = data
        showPasswordView()
      case .password:
        userPayload?.password = data
        if let country = self.userPayload?.country {
          if country == "Brasil" {
            self.showCPFView()
          } else {
            showNameView()
          }
        }
      case .cpf:
        userPayload?.cpf = data
        showNameView()
      case .name:
        userPayload?.name = data
        guard let user = userPayload else {
          return
        }
        self.delegate?.onSignUpCompleted(user)
      }
  }
}

