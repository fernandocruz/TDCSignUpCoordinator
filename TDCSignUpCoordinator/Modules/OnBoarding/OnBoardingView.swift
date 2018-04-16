//
//  OnBoardingView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 24/03/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol OnBoardingViewDelegate {
  func onSignUpButtonTapped()
}

class OnBoardingView: UIViewController {
  
  var delegate: OnBoardingViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  @IBAction func signUpButtonTapped(_ sender: Any) {
    self.delegate?.onSignUpButtonTapped()
  }
  

}
