//
//  DiscoverEmptyNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class DiscoverEmptyNode: ASDisplayNode {
  
  let boyMemojiNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 221),
      height: ASDimension(unit: .points, value: 233)
    )
    
    node.contentMode = .center
    node.image = Asset.Main.discoverBoyMemoji.image
    
    return node
    
  }()
  
  let descriptionNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: UIColor(displayP3Red: 0.61, green: 0.61, blue: 0.61, alpha: 1),
      font: .systemFont(ofSize: 18, weight: .regular),
      lineHeight: 21,
      alignment: .center
    ))
    
    node.setAttributedText("""
      Привет, встряхни телефон
      и я покажу случайный тур
      """)
    
    return node
    
  }()
  
  override init() {
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
  }
  
}
