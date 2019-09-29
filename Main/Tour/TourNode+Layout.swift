//
//  TourNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension TourNode {
  
  class func topBar(_ text: String) -> TourTopBarNode {
    
    let node = TourTopBarNode(text)
    
    node.backgroundColor = .white
    
    node.shadow = Shadow(
      color: UIColor(displayP3Red: 0.93, green: 0.91, blue: 1, alpha: 1),
      radius: 14,
      opacity: 0.25,
      offset: CGSize(width: 0, height: 14)
    )
    
    node.zPosition = 52
    
    return node
    
  }
  
  class func scrollNode(_ info: DiscoverTableCellNode.Info) -> TourScrollNode {
    
    let node = TourScrollNode(info)
    
    node.style.flexGrow = 1.0
    
    return node
    
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    stack.addElement(topBar)
    stack.addElement(scrollNode)
    
    return stack
    
  }
  
}
