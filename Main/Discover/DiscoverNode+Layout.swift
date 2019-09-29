//
//  DiscoverNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension DiscoverNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    topBarNode.searchFieldNode.setAttributedText("Франция")
    stack.addElement(topBarNode)
    
//    stack.addElement(emptyNode)
    stack.addElement(tableNode)
    
    return stack
    
  }
  
}
