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

protocol SignUpCoordinatorDelegate: class {
  func onSignUpCompleted(_ userPayload: UserPayload)
}

class SignUpCoordinator: Coordinator {
  
  let navigationController: UINavigationController
  
  weak var delegate: SignUpCoordinatorDelegate?
  
  var homeCoordinator: Coordinator?
  var userPayload: UserPayload?
  
  init(navigationController: UINavigationController = UINavigationController()) {
    self.navigationController = navigationController
    self.navigationController.navigationBar.isHidden = false

    self.userPayload = UserPayload()
  }
  
  func start() {
    showCountryView()
  }
  
  private func showCountryView() {
    let view = CountryView()
    view.delegate = self
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showEmailView() {
    let view = EmailView()
    view.delegate = self
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showPasswordView() {
    let view = PasswordView()
    view.delegate = self
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showCPFView() {
    let view = CPFView()
    view.delegate = self
    self.navigationController.pushViewController(view, animated: true)
  }
  
  private func showNameView() {
    let view = NameView()
    view.delegate = self
    self.navigationController.pushViewController(view, animated: true)
  }
  
}

extension SignUpCoordinator: CountryViewDelegate {
  func onCountryButtonTapped(country: String) {
    self.userPayload?.country = country
    self.showEmailView()
  }
}

extension SignUpCoordinator: EmailViewDelegate {
  func onEmailButtonTapped(email: String) {
    self.userPayload?.email = email
    self.showPasswordView()
  }
}

extension SignUpCoordinator: PasswordViewDelegate {
  func onPasswordButtonTapped(password: String) {
    self.userPayload?.password = password
    
    if let country = self.userPayload?.country {
      if country == "Brasil" {
        self.showCPFView()
      } else {
        showNameView()
      }
    }
  }
}

extension SignUpCoordinator: CPFViewDelegate {
  func onCPFButtonTapped(cpf: String) {
    self.userPayload?.cpf = cpf
    self.showNameView()
  }
}

extension SignUpCoordinator: NameViewDelegate {
  func onNameButtonTapped(name: String) {
    self.userPayload?.name = name
    
    guard let user = userPayload else {
      return
    }
    self.delegate?.onSignUpCompleted(user)
  }
}

