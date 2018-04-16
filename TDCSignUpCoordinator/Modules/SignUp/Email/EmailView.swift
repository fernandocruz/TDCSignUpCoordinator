//
//  EmailView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol EmailViewDelegate {
  func onEmailButtonTapped(email: String)
}

class EmailView: UIViewController {

  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var emailTextField: UITextField!
  
  var delegate: EmailViewDelegate?
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Email"
        self.emailTextField.becomeFirstResponder()
    }

  @IBAction func emailButtonTapped(_ sender: Any) {
    delegate?.onEmailButtonTapped(email: self.emailTextField.text!)
  }
}
