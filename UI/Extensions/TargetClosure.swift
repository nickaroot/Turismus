//
//  TargetClosure.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

@objc class TargetClosure: NSObject {
  
  let closure: () -> Void
  
  init (_ closure: @escaping () -> Void) {
    
    self.closure = closure
    
    super.init()
    
  }
  
  @objc func invoke() {
    
    closure()
    
  }
  
}

public extension ASControlNode {
  
  func addAction(for controlEvents: ASControlNodeEvent, _ closureBlock: @escaping () -> Void) {
    
    let targetClosure = TargetClosure(closureBlock)
    
    addTarget(targetClosure, action: #selector(TargetClosure.invoke), forControlEvents: controlEvents)
    
    objc_setAssociatedObject(
      self,
      String(format: "[%d]", arc4random()),
      targetClosure,
      objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
    )
    
  }
  
}

public extension UIControl {
  
  func addTarget(for controlEvents: UIControl.Event, _ closureBlock: @escaping () -> Void) {
    
    let targetClosure = TargetClosure(closureBlock)
    
    addTarget(targetClosure, action: #selector(TargetClosure.invoke), for: controlEvents)
    
    objc_setAssociatedObject(
      self,
      String(format: "[%d]", arc4random()),
      targetClosure,
      objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
    )
    
  }
  
}

public extension UIGestureRecognizer {
  
  convenience init(_ closureBlock: @escaping () -> Void) {
    
    let targetClosure = TargetClosure(closureBlock)
    
    self.init(target: targetClosure, action: #selector(TargetClosure.invoke))
    
    objc_setAssociatedObject(
      self,
      String(format: "[%d]", arc4random()),
      targetClosure,
      objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
    )
    
  }
  
}
