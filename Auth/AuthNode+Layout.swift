//
//  AuthNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension AuthNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack(aligned: .middle, .none)
    
    stack.addElement(coverNode)
    
    logoNode.style.spacingBefore = -150
    logoNode.style.spacingAfter = 150
    stack.addElement(logoNode)
    
    let memojiStack = HorizontalStack()
    
    memojiStack.size.width = ASDimension(unit: .fraction, value: 1)
    
    memojiStack.addElement(ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: -45, left: 0, bottom: 45, right: 0),
      child: boyMemojiNode
    ))
    
    memojiStack.addElement(Spacer)
    
    memojiStack.addElement(ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: -30, left: 0, bottom: 30, right: 0),
      child: girlMemojiNode
    ))
    
    memojiStack.style.spacingBefore = -109
    stack.addElement(memojiStack)
    
    signInForm.style.spacingBefore = -64
    signInForm.style.spacingAfter = -30
    stack.addElement(signInForm)
    
    return stack
    
  }
  
}
