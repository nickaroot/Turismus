//
//  DiscoverTableCellTagNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class DiscoverTableCellTagNode: ASDisplayNode {
  
  struct Tag {
    
    let text: String
    
    let tintColor: UIColor
    let textColor: UIColor
    
    init(_ text: String, tintColor: UIColor, textColor: UIColor = .black) {
      
      self.text = text
      
      self.tintColor = tintColor
      self.textColor = textColor
      
    }
    
  }
  
  let titleNode: TextNode = {
    
    let node = TextNode()
    
    return node
    
  }()
  
  init(_ tag: Tag) {
    
    super.init()
    
    border = Border(radius: 10)
    
    automaticallyManagesSubnodes = true
    
    backgroundColor = tag.tintColor
    
    titleNode.setAttributes(TextAttributes(
      color: tag.textColor,
      font: .systemFont(ofSize: 14, weight: .semibold),
      lineHeight: 17
    ))
    
    titleNode.setAttributedText(tag.text)
    
  }
  
}
