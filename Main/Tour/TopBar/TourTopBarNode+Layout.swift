//
//  TourTopBarNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension TourTopBarNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    titleNode.style.spacingBefore = 34
    stack.addElement(titleNode)
      
    let nameStack = HorizontalStack(aligned: .none, .center)
    
    backButtonNode.style.spacingBefore = -18
    nameStack.addElement(backButtonNode)
    
    destinationTextNode.style.spacingBefore = -2
    nameStack.addElement(destinationTextNode)
    
    stack.addElement(nameStack)
    
    stack.addElement(ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 6, left: 0, bottom: 0, right: -30),
      child: bottomLineNode
    ))
    
    return ASWrapperLayoutSpec(layoutElement: ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 32, left: 30, bottom: 39, right: 30),
      child: stack
    ))
    
  }
  
}
