//
//  ASDisplayNode.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

extension ASDisplayNode {
  
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
  
  open var shadow: Shadow {
    
    get {
      
      let shadowColor = UIColor(cgColor: self.shadowColor ?? UIColor.clear.cgColor)
      
      return Shadow(color: shadowColor, radius: shadowRadius, opacity: shadowOpacity, offset: shadowOffset)
    
    }
    
    set {
      
      clipsToBounds = false
      
      shadowColor = newValue.color.cgColor
      shadowRadius = newValue.radius
      shadowOpacity = newValue.opacity
      shadowOffset = newValue.offset
      
    }
    
  }
  
  open var border: Border {
    
    get {
      
      let borderColor = UIColor(cgColor: self.borderColor ?? UIColor.clear.cgColor)
      
      return Border(color: borderColor, width: borderWidth, radius: cornerRadius)
      
    }
    
    set {
      
      borderColor = newValue.color.cgColor
      borderWidth = newValue.width
      
      cornerRadius = newValue.radius
      
    }
    
  }
  
}
