//
//  DiscoverController.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

class DiscoverController: ASViewController<DiscoverNode> {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    
    return .default
    
  }
  
  var keyboardObserver: (NSObjectProtocol, NSObjectProtocol)?
  
  init() {
    
    super.init(node: DiscoverNode())
    
  }
  
  override func viewDidLoad() {
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    
  }
  
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
}
