//
//  DiscoverTableCellNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class DiscoverTableCellNode: ASCellNode {
  
  struct Info {
    
    let text: String
    let imageURL: String
    let tags: [DiscoverTableCellTagNode.Tag]
    
  }
  
  let imageNode: ASNetworkImageNode = {
    
    let node = ASNetworkImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 256)
    )
    
    node.border = Border(radius: 10)
    
    return node
    
  }()
  
  let titleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .semibold),
      lineHeight: 24
    ))
    
    return node
    
  }()
  
  let tags: [DiscoverTableCellTagNode.Tag]
  
  init(_ info: Info) {
    
    self.tags = info.tags
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
    selectionStyle = .none
    
    imageNode.setURL(
      URL(string: info.imageURL),
      resetToDefault: false
    )
    
    titleNode.setAttributedText(info.text)
    
  }
  
}
