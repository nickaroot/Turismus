//
//  AuthController.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import UI

class AuthController: ASViewController<AuthNode> {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    
    return .lightContent
    
  }
  
  var keyboardObserver: (NSObjectProtocol, NSObjectProtocol)?
  
  init() {
    
    super.init(node: AuthNode())
    
  }
  
  override func viewDidLoad() {
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    node.signInForm.signInButtonNode.touchUpInsideBlock = { [weak self] _ in
      
      self?.popToMain()
      
    }
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    keyboardObserver = Keyboard.subscribe(self,
      willShow: keyboardWillShow(notification:),
      willHide: keyboardWillHide(notification:)
    )
    
    popToMain() // FIXME
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    
    Keyboard.unsubscribe(keyboardObserver)
    
  }
  
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
  func popToMain() {
    
    let tabBarController = TabBarController()
    
    navigationController?.viewControllers.insert(tabBarController, at: 0)
    navigationController?.popViewController(animated: true)
    
  }
  
}
