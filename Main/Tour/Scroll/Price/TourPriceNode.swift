//
//  TourPriceNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class TourPriceNode: ASDisplayNode {
  
  let titleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 14, weight: .semibold),
      lineHeight: 17
    ))
    
    return node
    
  }()
  
  init(_ text: String) {
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
    titleNode.setAttributedText(text)
    
    border = Border(radius: 10)
    
    backgroundColor = UIColor(red: 0.87, green: 1, blue: 0.86, alpha: 1)
    
  }
  
}
