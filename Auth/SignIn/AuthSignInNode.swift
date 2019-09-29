//
//  AuthSignInNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class AuthSignInNode: ASScrollNode {
  
  let titleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 25, weight: .semibold),
      lineHeight: 30
    ))
    
    node.setAttributedText("Авторизация")
    
    return node
    
  }()
  
  let subtitleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: UIColor(displayP3Red: 0.61, green: 0.61, blue: 0.61, alpha: 1),
      font: .systemFont(ofSize: 16, weight: .regular),
      lineHeight: 19
    ))
    
    node.setAttributedText("Войдите чтобы продолжить")
    
    return node
    
  }()
  
  let emailIcon: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 47),
      height: ASDimension(unit: .points, value: 58)
    )
    
    node.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.91, blue: 1.0, alpha: 1.0)
    node.border = Border(radius: 10)
    
    node.contentMode = .center
    node.image = Asset.Auth.authEmailIcon.image
    
    return node
    
  }()
  
  let emailTitle: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 14, weight: .semibold),
      letterSpacing: 0.03
    ))
    
    node.setAttributedText("ЭЛЕКТРОПОЧТА")
    
    return node
    
  }()
  
  let emailField: TextFieldNode = {
    
    let node = TextFieldNode()
    
    node.setPlaceholderAttributes(TextAttributes(
      color: UIColor(displayP3Red: 0.61, green: 0.61, blue: 0.61, alpha: 1.0),
      font: .systemFont(ofSize: 20, weight: .regular),
      lineHeight: 24
    ))
    
    node.setPlaceholderAttributedText("name@mail.ru")
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 20, weight: .regular),
      lineHeight: 24,
      lineBreak: .byTruncatingTail
    ))
    
    node.keyboardType = .emailAddress
    node.autocapitalizationType = .none
    
    return node
    
  }()
  
  let emailLine: ASDisplayNode = {
    
    let node = ASDisplayNode()
    
    node.size.height = ASDimension(unit: .points, value: 1)
    node.style.flexGrow = 1.0
    
    node.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
    
    return node
    
  }()
  
  let passwordIcon: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 47),
      height: ASDimension(unit: .points, value: 58)
    )
    
    node.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.91, blue: 1.0, alpha: 1.0)
    node.border = Border(radius: 10)
    
    node.contentMode = .center
    node.image = Asset.Auth.authPasswordIcon.image
    
    return node
    
  }()
  
  let passwordTitle: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 14, weight: .semibold),
      letterSpacing: 0.03
    ))
    
    node.setAttributedText("ПАРОЛЬ")
    
    return node
    
  }()
  
  let passwordField: TextFieldNode = {
    
    let node = TextFieldNode()
    
    node.setPlaceholderAttributes(TextAttributes(
      color: UIColor(displayP3Red: 0.61, green: 0.61, blue: 0.61, alpha: 1.0),
      font: .systemFont(ofSize: 20, weight: .regular),
      lineHeight: 24,
      lineBreak: .byTruncatingTail
    ))
    
    node.setPlaceholderAttributedText("qwerty123")
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 20, weight: .regular),
      lineHeight: 24
    ))
    
    node.isSecureTextEntry = true
    node.autocapitalizationType = .none
    
    return node
    
  }()
  
  let passwordLine: ASDisplayNode = {
    
    let node = ASDisplayNode()
    
    node.size.height = ASDimension(unit: .points, value: 1)
    node.style.flexGrow = 1.0
    
    node.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.93, blue: 0.93, alpha: 1.0)
    
    return node
    
  }()
  
//  let vkSignInButtonNode: ButtonNode = {
//
//    let node = ButtonNode()
//
//    node.size = ASLayoutSize(
//      width: ASDimension(unit: .points, value: 55),
//      height: ASDimension(unit: .points, value: 55)
//    )
//
//    node.backgroundColor = UIColor(displayP3Red: 0.27, green: 0.5, blue: 0.76, alpha: 1.0)
//    node.border = Border(radius: 10)
//
//    node.setImage(Asset.Auth.authVKLogo.image)
//
//    return node
//
//  }()
  
  let signInButtonNode: ButtonNode = {
    
    let node = ButtonNode()
    
    node.size.height = ASDimension(unit: .points, value: 55)
    node.style.flexGrow = 1.0
    
    node.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.91, blue: 1.0, alpha: 1.0)
    
    node.border = Border(radius: 10)
    
    node.titleNode.setAttributes(TextAttributes(color: .black, font: .systemFont(ofSize: 18, weight: .regular)))
    node.titleNode.setAttributedText("Войти в аккаунт")
    
    return node
    
  }()
  
  let signUpButtonNode: ButtonNode = {
    
    let node = ButtonNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 55)
    )
    
    node.backgroundColor = UIColor(displayP3Red: 0.17, green: 0, blue: 1.0, alpha: 1.0)
    
    node.border = Border(radius: 10)
    
    node.titleNode.setAttributes(TextAttributes(color: .white, font: .systemFont(ofSize: 18, weight: .regular)))
    node.titleNode.setAttributedText("Регистрация")
    
    return node
    
  }()
  
  override init() {
    
    super.init()
    
    automaticallyManagesSubnodes = true
    automaticallyManagesContentSize = true
    
  }
  
}
