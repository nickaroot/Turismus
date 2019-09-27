//
//  Border.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit

public struct Border {
  
  public let color: UIColor
  public let width: CGFloat
  public let radius: CGFloat
  
  public init(color: UIColor = .clear, width: CGFloat = 0, radius: CGFloat = 0) {
    
    self.color = color
    self.width = width
    self.radius = radius
    
  }
  
  public static let none = Border(color: .clear, width: 0, radius: 0)
  
}
