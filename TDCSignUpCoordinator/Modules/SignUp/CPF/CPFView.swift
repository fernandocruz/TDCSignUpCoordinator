//
//  CPFView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol CPFViewDelegate {
  func onCPFButtonTapped(cpf: String)
}

class CPFView: UIViewController {
  
  @IBOutlet weak var cpfLabel: UILabel!
  @IBOutlet weak var cpfTextField: UITextField!
  
  var delegate: CPFViewDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CPF"
        self.cpfTextField.becomeFirstResponder()

    }
  
  @IBAction func cpfButtonTapped(_ sender: Any) {
    self.delegate?.onCPFButtonTapped(cpf: self.cpfTextField.text!)
  }
  
}
