//
//  NameView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol NameViewDelegate {
  func onNameButtonTapped(name: String)
}

class NameView: UIViewController {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var nameTextField: UITextField!
  
  var delegate: NameViewDelegate?
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Nome"
        self.nameTextField.becomeFirstResponder()
    }

  @IBAction func nameButtonTapped(_ sender: Any) {
    self.delegate?.onNameButtonTapped(name: self.nameTextField.text!)
  }
}
