//
//  DiscoverNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

class DiscoverNode: ASDisplayNode {
  
  let topBarNode: DiscoverTopBarNode = {
    
    let node = DiscoverTopBarNode()
    
    node.backgroundColor = .white
    
    node.shadow = Shadow(
      color: UIColor(displayP3Red: 0.93, green: 0.91, blue: 1, alpha: 1),
      radius: 14,
      opacity: 0.25,
      offset: CGSize(width: 0, height: 14)
    )
    
    node.zPosition = 52
    
    return node
    
  }()
  
  let tableNode: DiscoverTableNode = {
    
    let node = DiscoverTableNode()
    
    node.style.flexGrow = 1
    node.zPosition = 51
    node.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    
    return node
    
  }()
  
  let emptyNode: DiscoverEmptyNode = {
    
    let node = DiscoverEmptyNode()
    
    node.style.flexGrow = 1
    node.zPosition = 50
    
    return node
    
  }()
  
  override init() {
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
    backgroundColor = .white
    
  }
  
}
