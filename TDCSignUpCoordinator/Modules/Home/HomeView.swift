//
//  HomeView.swift
//  TDCSignUpCoordinator
//
//  Created by Luis Fernando Cruz Santos on 08/04/2018.
//  Copyright © 2018 Fernando Cruz. All rights reserved.
//

import UIKit

protocol HomeViewDelegate: class {
  func logout()
}

class HomeView: UIViewController {
  
  @IBOutlet weak var welcomeMessageLabel: UILabel!
  
  let user: User
  
  weak var delegate: HomeViewDelegate?
  
  init(user: User) {
    self.user = user
    super.init(nibName: "HomeView", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.welcomeMessageLabel.text = "\(self.user.name), Bem-Vindo ao TDC"
  }
  
  @IBAction func logoutButtonTapped(_ sender: Any) {
    self.delegate?.logout()
  }
  
}
