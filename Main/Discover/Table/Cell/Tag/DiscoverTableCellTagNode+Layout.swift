//
//  DiscoverTableCellTagNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension DiscoverTableCellTagNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    return ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
      child: titleNode
    )
    
  }
  
}
