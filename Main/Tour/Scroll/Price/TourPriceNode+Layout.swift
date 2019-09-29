//
//  TourPriceNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension TourPriceNode {
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    return ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 20),
      child: titleNode.centerSpec
    )
    
  }
  
}
