//
//  Button.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

open class ButtonNode: ASControlNode, ButtonDelegate {
  
  public typealias ButtonActionBlock = ((ASControlNode) -> Void)
  
  open var normalBackgroundColor: UIColor?
  open var disabledBackgroundColor: UIColor?
  open var highlightedBackgroundColor: UIColor?
  
  open override var isHighlighted: Bool {
    
    willSet {
      
      if isHighlighted != newValue && isEnabled {
        
        if newValue {
          
          guard let highlightedBackgroundColor = highlightedBackgroundColor else { return }
          
          normalBackgroundColor = backgroundColor
          
          UIView.animate(withDuration: touchAnimationDuration, delay: 0,
                         options: [.beginFromCurrentState], animations: { [weak self] in
                          
            guard let `self` = self else { return }
            
            self.backgroundColor = highlightedBackgroundColor
            
          }, completion: nil)
          
        } else {
          
          guard let normalBackgroundColor = normalBackgroundColor else { return }
          
          UIView.animate(withDuration: touchAnimationDuration, delay: 0,
                         options: [.beginFromCurrentState], animations: { [weak self] in
                          
            guard let `self` = self else { return }
            
            self.backgroundColor = normalBackgroundColor
            
          })
          
        }
        
      }
      
    }
    
  }
  
  open override var isEnabled: Bool {
    
    willSet {
      
      if isEnabled != newValue {
        
        if !newValue {
          
          guard let disabledBackgroundColor = disabledBackgroundColor else { return }
          
          normalBackgroundColor = backgroundColor
          
          UIView.animate(withDuration: touchAnimationDuration, delay: 0,
                         options: [.beginFromCurrentState], animations: { [weak self] in
                          
            guard let `self` = self else { return }
          
            self.backgroundColor = disabledBackgroundColor
            
          })
          
        } else {
          
          guard let normalBackgroundColor = normalBackgroundColor else { return }
          
          UIView.animate(withDuration: touchAnimationDuration, delay: 0,
                         options: [.beginFromCurrentState], animations: { [weak self] in
                          
            guard let `self` = self else { return }
            
            self.backgroundColor = normalBackgroundColor
            
          })
          
        }
        
      }
      
    }
    
  }
  
  open var titleNode: TextNode = {
    
    let node = TextNode()
    
    node.style.flexShrink = 1.0
    
    return node
    
  }()
  
  open func setAttributedTitle(_ attributedText: NSAttributedString) {
    
    titleNode.attributedText = attributedText
    
  }
  
  open var imageNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.contentMode = .center
    
    return node
    
  }()
  
  open func setImage(_ image: UIImage) {
    
    imageNode.image = image
    
  }
  
  public override init() {
    
    super.init()
    
    addSubnode(titleNode)
    addSubnode(imageNode)
    
    addActions()
    
  }
  
  open func addActions() {
    
    addAction(for: .touchDown, { self.touchDown(self) })
    addAction(for: .touchDownRepeat, { self.touchDownRepeat(self) })
    addAction(for: .touchDragInside, { self.touchDragInside(self) })
    addAction(for: .touchDragOutside, { self.touchDragOutside(self) })
    addAction(for: .touchUpInside, { self.touchUpInside(self) })
    addAction(for: .touchUpOutside, { self.touchUpOutside(self) })
    addAction(for: .touchCancel, { self.touchCancel(self) })
    addAction(for: .valueChanged, { self.valueChanged(self) })
    
  }
  
  open override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let bgSpec = ASBackgroundLayoutSpec(child: imageNode.centerSpec, background: titleNode.centerSpec)
    
    return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: bgSpec)
    
  }
  
  open var touchAnimationDuration: TimeInterval {
    
    return 0.24
    
  }
  
  open var touchDownBlock: ButtonActionBlock?
  
  open func touchDown(_ controlNode: ASControlNode) {
    
    self.isHighlighted = true
    
    guard let touchDownBlock = touchDownBlock else { return }
    
    touchDownBlock(controlNode)
    
  }
  
  open var touchDownRepeatBlock: ButtonActionBlock?
  
  open func touchDownRepeat(_ controlNode: ASControlNode) {
    
    self.isHighlighted = false
    
    guard let touchDownRepeatBlock = touchDownRepeatBlock else { return }
    
    touchDownRepeatBlock(controlNode)
    
  }
  
  open var touchDragInsideBlock: ButtonActionBlock?
  
  open func touchDragInside(_ controlNode: ASControlNode) {
    
    guard let touchDragInsideBlock = touchDragInsideBlock else { return }
    
    touchDragInsideBlock(controlNode)
    
  }
  
  open var touchDragOutsideBlock: ButtonActionBlock?
  
  open func touchDragOutside(_ controlNode: ASControlNode) {
    
    guard let touchDragOutsideBlock = touchDragOutsideBlock else { return }
    
    touchDragOutsideBlock(controlNode)
    
  }
  
  open var touchUpInsideBlock: ButtonActionBlock?
  
  open func touchUpInside(_ controlNode: ASControlNode) {
    
    self.isHighlighted = false
    
    guard let touchUpInsideBlock = touchUpInsideBlock else { return }
    
    touchUpInsideBlock(controlNode)
    
  }
  
  open var touchUpOutsideBlock: ButtonActionBlock?
  
  open func touchUpOutside(_ controlNode: ASControlNode) {
    
    self.isHighlighted = false
    
    guard let touchUpOutsideBlock = touchUpOutsideBlock else { return }
    
    touchUpOutsideBlock(controlNode)
    
  }
  
  open var touchCancelBlock: ButtonActionBlock?
  
  open func touchCancel(_ controlNode: ASControlNode) {
    
    self.isHighlighted = false
    
    guard let touchCancelBlock = touchCancelBlock else { return }
    
    touchCancelBlock(controlNode)
    
  }
  
  open var valueChangedBlock: ButtonActionBlock?
  
  open func valueChanged(_ controlNode: ASControlNode) {
    
    guard let valueChangedBlock = valueChangedBlock else { return }
    
    valueChangedBlock(controlNode)
    
  }
  
}
