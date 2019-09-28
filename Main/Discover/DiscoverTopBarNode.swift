//
//  DiscoverTopBarNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class DiscoverTopBarNode: ASDisplayNode {
  
  let titleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: UIColor(displayP3Red: 0.87, green: 0.85, blue: 0.95, alpha: 1),
      font: .systemFont(ofSize: 14, weight: .semibold),
      letterSpacing: 0.03,
      lineHeight: 17
    ))
    
    node.setAttributedText("ПУНКТ ПРИБЫТИЯ")
    
    return node
    
  }()
  
  let searchFieldNode: TextFieldNode = {
    
    let node = TextFieldNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .semibold),
      lineHeight: 21
    ))
    
    node.setPlaceholderAttributes(TextAttributes(
      color: UIColor(displayP3Red: 0.59, green: 0.58, blue: 0.65, alpha: 1),
      font: .systemFont(ofSize: 18, weight: .regular),
      lineHeight: 21
    ))
    
    node.setPlaceholderAttributedText("Куда хотите полететь?")
    
    return node
    
  }()
  
  let searchButtonNode: ButtonNode = {
    
    let node = ButtonNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 44),
      height: ASDimension(unit: .points, value: 44)
    )
    
    node.imageNode.contentMode = .center
    node.setImage(Asset.Main.searchIcon.image)
    
    return node
    
  }()
  
  let bottomLineNode: ASDisplayNode = {
    
    let node = ASDisplayNode()
    
    node.size.height = ASDimension(unit: .points, value: 1)
    node.style.flexGrow = 1.0
    
    node.backgroundColor = UIColor(displayP3Red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
    
    return node
    
  }()
  
  override init() {
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
  }
  
}
