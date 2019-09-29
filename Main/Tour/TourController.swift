//
//  TourController.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class TourController: ASViewController<TourNode> {
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    
    return .default
    
  }
  
  init(_ info: DiscoverTableCellNode.Info) {
    
    super.init(node: TourNode(info))
    
  }
  
  override func viewDidLoad() {
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    
    if let tabBarHeight = tabBarController?.tabBar.frame.height {
      
      node.scrollNode.view.contentInset.bottom = tabBarHeight * 2
      
    }
    
  }
  
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
}
