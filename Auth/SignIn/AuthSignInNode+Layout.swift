//
//  AuthSignInNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension AuthSignInNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    stack.addElement(titleNode)
    
    subtitleNode.style.spacingBefore = 4
    stack.addElement(subtitleNode)
    
    let emailStack = HorizontalStack()
    
    emailStack.addElement(emailIcon)
    
    let emailInputStack = VerticalStack()
    
    emailInputStack.style.flexGrow = 1.0
    
    emailTitle.style.spacingBefore = 4
    emailInputStack.addElement(emailTitle)
    
    emailField.style.spacingBefore = 7
    emailInputStack.addElement(emailField)
    
    emailInputStack.addElement(ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: -30),
      child: emailLine
    ))
    
    emailInputStack.style.spacingBefore = 20
    emailStack.addElement(emailInputStack)
    
    emailStack.style.spacingBefore = 35
    stack.addElement(emailStack)
    
    let passwordStack = HorizontalStack()
    
    passwordStack.addElement(passwordIcon)
    
    let passwordInputStack = VerticalStack()
    
    passwordInputStack.style.flexGrow = 1.0
    
    passwordTitle.style.spacingBefore = 4
    passwordInputStack.addElement(passwordTitle)
    
    passwordField.style.spacingBefore = 7
    passwordInputStack.addElement(passwordField)
    
    passwordInputStack.addElement(ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 12, left: 0, bottom: 0, right: -30),
      child: passwordLine
    ))
    
    passwordInputStack.style.spacingBefore = 20
    passwordStack.addElement(passwordInputStack)
    
    passwordStack.style.spacingBefore = 35
    passwordStack.style.spacingAfter = 35
    stack.addElement(passwordStack)
    
    stack.addElement(Spacer)
    
    let signInStack = HorizontalStack()
    
//    signInStack.addElement(vkSignInButtonNode)
    
//    signInButtonNode.style.spacingBefore = 12
    signInStack.addElement(signInButtonNode)
    
    stack.addElement(signInStack)
    
    signUpButtonNode.style.spacingBefore = 30
    signUpButtonNode.style.spacingAfter = 30
    stack.addElement(signUpButtonNode)
    
    let wrapper = ASWrapperLayoutSpec(layoutElement: ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 35, left: 30, bottom: 50, right: 30),
      child: stack
    ))
    
    return wrapper
    
  }
  
}
