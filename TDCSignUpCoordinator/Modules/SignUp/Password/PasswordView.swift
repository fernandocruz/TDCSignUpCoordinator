//
//  PasswordView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol PasswordViewDelegate {
  func onPasswordButtonTapped(password: String)
}

class PasswordView: UIViewController {

  @IBOutlet weak var passwordLabel: UILabel!
  @IBOutlet weak var passwordTextField: UITextField!
  
  var delegate: PasswordViewDelegate?
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Senha"
        self.passwordTextField.becomeFirstResponder()
        self.passwordTextField.isSecureTextEntry = true
    }
  
  @IBAction func passwordButtonTapped(_ sender: Any) {
    self.delegate?.onPasswordButtonTapped(password: self.passwordTextField.text!)
  }
  
}
