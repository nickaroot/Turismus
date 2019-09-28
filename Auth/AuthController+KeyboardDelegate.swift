//
//  AuthController+KeyboardDelegate.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import UI

extension AuthController: KeyboardDelegate {
  
  func keyboardDidChange() {
    
    node.transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: nil)
    
  }
  
}
