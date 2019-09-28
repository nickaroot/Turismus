//
//  TextNode.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

open class TextNode: ASTextNode {
  
  open var attributes = [NSAttributedString.Key: Any]()
  
  open func setAttributes(_ attributes: TextAttributes) {
    
    if let color = attributes.color {
      
      self.attributes[NSAttributedString.Key.foregroundColor] = color
      
    }
    
    if let font = attributes.font {
      
      self.attributes[NSAttributedString.Key.font] = font
      
    }
    
    if let letterSpacing = attributes.letterSpacing {
      
      self.attributes[NSAttributedString.Key.kern] = letterSpacing
      
    }
    
    let paragraphStyle = NSMutableParagraphStyle()
    
    if let lineHeight = attributes.lineHeight {
      
      paragraphStyle.maximumLineHeight = lineHeight
      paragraphStyle.minimumLineHeight = lineHeight
      
    }
    
    if let alignment = attributes.alignment {
      
      paragraphStyle.alignment = alignment
      
    }
    
    if let lineBreak = attributes.lineBreak {
      
      paragraphStyle.lineBreakMode = lineBreak
      
    }
    
    self.attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
    
  }
  
  public func setAttributedText(_ text: String) {
    
    let attributedText = NSAttributedString(string: text, attributes: attributes)
    
    self.attributedText = attributedText
    
  }
  
  open func appendAttributedText(_ text: String) {
    
    let attributedText = NSMutableAttributedString()
    
    let oldAttributedText = self.attributedText ?? NSAttributedString()
    
    attributedText.append(oldAttributedText)
    
    let newAttributedText = NSAttributedString(string: text, attributes: attributes)
    
    attributedText.append(newAttributedText)
    
    self.attributedText = attributedText
    
  }
  
  open func appendAttributedText(_ text: String, _ attributes: TextAttributes) {
    
    let oldAttributes = self.attributes
    
    let attributedText = NSMutableAttributedString()
    
    let oldAttributedText = self.attributedText ?? NSAttributedString()
    
    attributedText.append(oldAttributedText)
    
    setAttributes(attributes)
    
    let newAttributedText = NSAttributedString(string: text, attributes: self.attributes)
    
    attributedText.append(newAttributedText)
    
    self.attributedText = attributedText
    
    self.attributes = oldAttributes
    
  }
  
}
