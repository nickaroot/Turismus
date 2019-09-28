//
//  TextFieldNode+ASEditableTextNodeDelegate.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

extension TextFieldNode: ASEditableTextNodeDelegate {
  
  open func obtainNewText(_ range: NSRange, _ text: String) -> Bool {
    
    let isNewLine = text.contains("\n")
    
    if isNewLine && !multipleLines {
      
      var trimmedText = text
      
      trimmedText.removeAll(where: { $0 == "\n" })
      
      appendAttributedText(trimmedText)
      
      return false
      
    }
    
    if isSecureTextEntry {
      
      secureText = ((secureText ?? "") as NSString).replacingCharacters(in: range, with: text)
      
      return true
      
    }
    
    return true
    
  }
  
  open func editableTextNode(_ editableTextNode: ASEditableTextNode,
                             shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    
    return obtainNewText(range, text)
    
  }
  
  open func editableTextNodeShouldBeginEditing(_ editableTextNode: ASEditableTextNode) -> Bool { return true }
  
  open func editableTextNodeDidBeginEditing(_ editableTextNode: ASEditableTextNode) { }
  
  open func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
    
    if isSecureTextEntry {
      
      setAttributedText(String(repeating: "•", count: secureText?.count ?? 0))
      
    }
    
  }
  
  open func editableTextNodeDidFinishEditing(_ editableTextNode: ASEditableTextNode) { }
  
  open func editableTextNodeDidChangeSelection(_ editableTextNode: ASEditableTextNode, fromSelectedRange: NSRange,
                                               toSelectedRange: NSRange, dueToEditing: Bool) { }
  
}
