//
//  TourNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class TourNode: ASDisplayNode {
  
  let topBar: TourTopBarNode
  let scrollNode: TourScrollNode
  
  init(_ info: ServiceLayer.Trip) {
    
    topBar = TourNode.topBar(info.flight.destination_name)
    scrollNode = TourNode.scrollNode(info)
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
    backgroundColor = .white
    
  }
  
}
