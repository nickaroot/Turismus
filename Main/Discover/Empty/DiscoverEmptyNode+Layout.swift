//
//  DiscoverEmptyNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension DiscoverEmptyNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack(aligned: .middle, .center)
    
    stack.addElement(boyMemojiNode)
    
    descriptionNode.style.spacingBefore = 22
    stack.addElement(descriptionNode)
    
    return ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 0, left: 0, bottom: constrainedSize.min.height / 4, right: 0),
      child: stack
    )
    
  }
  
}
