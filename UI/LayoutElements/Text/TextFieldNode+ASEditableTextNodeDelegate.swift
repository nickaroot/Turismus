//
//  TextFieldNode+ASEditableTextNodeDelegate.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

extension TextFieldNode: ASEditableTextNodeDelegate {
  
  open func obtainNewText(_ text: String) -> Bool {
    
    let isNewLine = text.contains("\n")
    
    if isNewLine && !multipleLines {
      
      var trimmedText = text
      
      trimmedText.removeAll(where: { $0 == "\n" })
      
      appendAttributedText(trimmedText)
      
      return false
      
    }
    
    return true
    
  }
  
  open func editableTextNode(_ editableTextNode: ASEditableTextNode,
                             shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    
    return obtainNewText(text)
    
  }
  
  open func editableTextNodeShouldBeginEditing(_ editableTextNode: ASEditableTextNode) -> Bool { return true }
  
  open func editableTextNodeDidBeginEditing(_ editableTextNode: ASEditableTextNode) { }
  
  open func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) { }
  
  open func editableTextNodeDidFinishEditing(_ editableTextNode: ASEditableTextNode) { }
  
  open func editableTextNodeDidChangeSelection(_ editableTextNode: ASEditableTextNode, fromSelectedRange: NSRange,
                                               toSelectedRange: NSRange, dueToEditing: Bool) { }
  
}
