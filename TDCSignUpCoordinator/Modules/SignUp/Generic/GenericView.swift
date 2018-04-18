//
//  PasswordView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol GenericViewDelegate: class {
  func onButtonTapped(data: String, currentStep: Steps)
}

class GenericView: UIViewController {

  @IBOutlet weak var GenericLabel: UILabel!
  @IBOutlet weak var GenericTextField: UITextField!
  
  weak var delegate: GenericViewDelegate?
  var currentStep: Steps?
  
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
        self.GenericTextField.becomeFirstResponder()
    
        switch currentStep! {
        case .country:
          configureCountry()
        case .email:
          configureEmail()
        case .password:
          configurePassword()
        case .cpf:
          configureCPF()
        case .name:
          configureName()
        }
    }
  
  @IBAction func passwordButtonTapped(_ sender: Any) {
    self.delegate?.onButtonTapped(data: self.GenericTextField.text!, currentStep: self.currentStep!)
  }
  
}

extension GenericView {
  func configureCountry(){
    self.title = "País"
    self.GenericLabel.text = "Olá, tudo bom? Pra começar, conta pra gente: em qual país você mora?"
  }
  func configureEmail(){
    self.title = "Email"
    self.GenericLabel.text = "Que legal! Certo, agora precisamos do seu Email. Esse será usado para ser seu Login :)"
  }
  func configurePassword(){
    self.title = "Password"
    self.GenericLabel.text = "Agora é hora de escolher uma senha bem segura para proteger sua conta."
    GenericTextField.isSecureTextEntry = true
  }
  func configureCPF(){
    self.title = "CPF"
    self.GenericLabel.text = "Para continuar precisamos do seu CPF, já estamos quase lá."
  }
  func configureName() {
    self.title = "Nome"
    self.GenericLabel.text = "Ei, para finalizar conta seu Nome completo pra gente."
  }
}
