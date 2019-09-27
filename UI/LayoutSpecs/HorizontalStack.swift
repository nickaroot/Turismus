//
//  HorizontalStack.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

open class HorizontalStack: ASStackLayoutSpec {
  
  open var insets = UIEdgeInsets.zero
  
  open var insetSpec: ASInsetLayoutSpec {
    
    return ASInsetLayoutSpec(insets: insets, child: self)
    
  }
  
  open var centerSpec: ASCenterLayoutSpec {
    
    return ASCenterLayoutSpec(
      horizontalPosition: .center,
      verticalPosition: .center,
      sizingOption: .minimumSize,
      child: self
    )
    
  }
  
  open var size: ASLayoutSize {
    
    get {
      
      return style.preferredLayoutSize
      
    }
    
    set {
      
      style.preferredLayoutSize = newValue
      
    }
    
  }
  
  open func addElement(_ element: ASLayoutElement) {
    
    var children = self.children ?? [ASLayoutElement]()
    
    children.append(element)
    
    self.children = children
    
  }
  
  public override init() {
    
    super.init()
    
    direction = .horizontal
    
  }
  
  public init(aligned horizontalAlignment: ASHorizontalAlignment, _ verticalAlignment: ASVerticalAlignment) {
    
    super.init()
    
    direction = .horizontal
    
    self.horizontalAlignment = horizontalAlignment
    self.verticalAlignment = verticalAlignment
    
  }
  
}
