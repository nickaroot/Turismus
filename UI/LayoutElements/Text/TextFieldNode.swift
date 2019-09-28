//
//  TextFieldNode.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

open class TextFieldNode: ASEditableTextNode {
  
  open var attributes = [NSAttributedString.Key: Any]()
  
  open var placeholderAttributes = [NSAttributedString.Key: Any]()
  
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
    
    let typingAttributes = Dictionary(uniqueKeysWithValues:
      self.attributes.lazy.map { ($0.key.rawValue, $0.value) }
    )
    
    self.typingAttributes = typingAttributes
    
  }
  
  open func setPlaceholderAttributes(_ attributes: TextAttributes) {
    
    if let color = attributes.color {
      
      self.placeholderAttributes[NSAttributedString.Key.foregroundColor] = color
      
    }
    
    if let font = attributes.font {
      
      self.placeholderAttributes[NSAttributedString.Key.font] = font
      
    }
    
    if let letterSpacing = attributes.letterSpacing {
      
      self.placeholderAttributes[NSAttributedString.Key.kern] = letterSpacing
      
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
    
    self.placeholderAttributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
    
  }
  
  open func setAttributedText(_ text: String) {
    
    let attributedText = NSAttributedString(string: text, attributes: attributes)
    
    self.attributedText = attributedText
    
  }
  
  open func setPlaceholderAttributedText(_ text: String) {
    
    let attributedText = NSAttributedString(string: text, attributes: placeholderAttributes)
    
    self.attributedPlaceholderText = attributedText
    
  }
  
  open func appendAttributedText(_ text: String) {
    
    let attributedText = NSMutableAttributedString()
    
    let oldAttributedText = self.attributedText ?? NSAttributedString()
    
    attributedText.append(oldAttributedText)
    
    let newAttributedText = NSAttributedString(string: text, attributes: attributes)
    
    attributedText.append(newAttributedText)
    
    self.attributedText = attributedText
    
  }
  
  open func appendPlaceholderAttributedText(_ text: String) {
    
    let attributedText = NSMutableAttributedString()
    
    let oldAttributedText = self.attributedPlaceholderText ?? NSAttributedString()
    
    attributedText.append(oldAttributedText)
    
    let newAttributedText = NSAttributedString(string: text, attributes: placeholderAttributes)
    
    attributedText.append(newAttributedText)
    
    self.attributedPlaceholderText = attributedText
    
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
  
  open func appendPlaceholderAttributedText(_ text: String, _ attributes: TextAttributes) {
    
    let oldAttributes = self.placeholderAttributes
    
    let attributedText = NSMutableAttributedString()
    
    let oldAttributedText = self.attributedPlaceholderText ?? NSAttributedString()
    
    attributedText.append(oldAttributedText)
    
    setAttributes(attributes)
    
    let newAttributedText = NSAttributedString(string: text, attributes: self.placeholderAttributes)
    
    attributedText.append(newAttributedText)
    
    self.attributedPlaceholderText = attributedText
    
    self.placeholderAttributes = oldAttributes
    
  }
  
  open var multipleLines = true
  
  public override init() {
    
    super.init()
    
    delegate = self
    
  }
  
  public override init(textKitComponents: ASTextKitComponents, placeholderTextKitComponents: ASTextKitComponents) {
    
    super.init(textKitComponents: textKitComponents, placeholderTextKitComponents: placeholderTextKitComponents)
    
    delegate = self
    
  }
  
}
