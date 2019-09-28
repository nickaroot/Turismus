//
//  ButtonDelegate.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

public protocol ButtonDelegate: class {
  
  func touchDown(_ controlNode: ASControlNode)
  
  func touchDownRepeat(_ controlNode: ASControlNode)
  
  func touchDragInside(_ controlNode: ASControlNode)
  
  func touchDragOutside(_ controlNode: ASControlNode)
  
  func touchUpInside(_ controlNode: ASControlNode)
  
  func touchUpOutside(_ controlNode: ASControlNode)
  
  func touchCancel(_ controlNode: ASControlNode)
  
  func valueChanged(_ controlNode: ASControlNode)
  
}
