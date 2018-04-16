//
//  CountryView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol CountryViewDelegate {
  func onCountryButtonTapped(country: String)
}

class CountryView: UIViewController {
  
  @IBOutlet weak var countryLabel: UILabel!
  @IBOutlet weak var countryTextField: UITextField!
  
  var delegate: CountryViewDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.title = "País"
        self.countryTextField.becomeFirstResponder()

    }

  @IBAction func countryButtonTapped(_ sender: Any) {
    self.delegate?.onCountryButtonTapped(country: self.countryTextField.text!)
  }
}
