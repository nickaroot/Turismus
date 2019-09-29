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
      
      ServiceLayer.signIn(
      creds: ServiceLayer.SignCredentials(
        email: self?.node.signInForm.emailField.attributedText?.string ?? "",
        password: self?.node.signInForm.passwordField.secureText ?? ""
      )) { (success, error) in
        
        if success {
          
          self?.popToMain()
          
        } else {
          
          let alert = UIAlertController(title: "Ошибка!", message: error?.localizedDescription, preferredStyle: .alert)
          
          if let code = error?.asAFError?.responseCode, code == 401 {
            
            alert.message = "Неверный логин или пароль"
            
          }
          
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            alert.dismiss(animated: true, completion: nil)
            
          }))
          
          self?.navigationController?.present(alert, animated: true, completion: nil)
          
        }
        
      }
      
    }
    
    node.signInForm.signUpButtonNode.touchUpInsideBlock = { [weak self] _ in
      
      ServiceLayer.signUp(
      creds: ServiceLayer.SignCredentials(
        email: self?.node.signInForm.emailField.attributedText?.string ?? "",
        password: self?.node.signInForm.passwordField.secureText ?? ""
      )) { (success, error) in
        
        if success {
          
          self?.popToMain()
          
        } else {
          
          let alert = UIAlertController(title: "Ошибка!", message: error?.localizedDescription, preferredStyle: .alert)
          
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            alert.dismiss(animated: true, completion: nil)
            
          }))
          
          self?.navigationController?.present(alert, animated: true, completion: nil)
          
        }
        
      }
      
    }
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    keyboardObserver = Keyboard.subscribe(self,
      willShow: keyboardWillShow(notification:),
      willHide: keyboardWillHide(notification:)
    )
    
//    popToMain() // FIXME
    
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
