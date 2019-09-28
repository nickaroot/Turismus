//
//  DiscoverTopBarNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension DiscoverTopBarNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    titleNode.style.spacingBefore = 46
    stack.addElement(titleNode)
    
    let searchStack = HorizontalStack(aligned: .none, .center)
    searchFieldNode.style.spacingBefore = 3
    
    searchStack.addElement(searchFieldNode)
    searchStack.addElement(Spacer)
    searchStack.addElement(searchButtonNode)
    
    stack.addElement(ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 17, left: 0, bottom: 0, right: -30),
      child: bottomLineNode
    ))
    
    return ASWrapperLayoutSpec(layoutElement: ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 32, left: 30, bottom: 39, right: 30),
      child: stack
    ))
    
  }
  
}
