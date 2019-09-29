//
//  DiscoverController+ASTableDataSource.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension DiscoverController: ASTableDataSource {
  
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    
    return info.count
    
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    
    return { [weak self] in
      
      guard let info = self?.info[indexPath.item] else { return ASCellNode() }
      
      let cell = DiscoverTableCellNode(info)
      
      return cell
      
    }
    
  }
  
}
