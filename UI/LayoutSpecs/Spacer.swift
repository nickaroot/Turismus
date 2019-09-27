//
//  Spacer.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

public var Spacer: ASLayoutSpec {
  
  return SpacerSpec()
  
}

internal class SpacerSpec: ASLayoutSpec {
  
  internal override init() {
    
    super.init()
    
    style.flexGrow = 1.0
    
  }
  
}
