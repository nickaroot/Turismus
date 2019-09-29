//
//  DiscoverTableCellNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension DiscoverTableCellNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    stack.addElement(imageNode)
    
    titleNode.style.spacingBefore = 24
    stack.addElement(titleNode)
    
    let tagsStack = HorizontalStack()
    
    tagsStack.flexWrap = .wrap
    tagsStack.spacing = 10
    tagsStack.lineSpacing = 10
    
    for tag in tags {
      
      tagsStack.addElement(DiscoverTableCellTagNode(tag))
      
    }
    
    tagsStack.style.spacingBefore = 10
    stack.addElement(tagsStack)
    
    return ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 35, left: 30, bottom: 35, right: 30),
      child: stack
    )
    
  }
  
}
