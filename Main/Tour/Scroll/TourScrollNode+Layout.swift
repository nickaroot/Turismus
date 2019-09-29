//
//  TourScrollNode+Layout.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI

extension TourScrollNode {
  
  class func flightOptionNode(_ text: String) -> TourOptionNode {
    
    let node = TourOptionNode(text)
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 0.5),
      height: ASDimension(unit: .points, value: 55)
    )
    
    return node
    
  }
  
  class func departureOptionNode(_ text: String) -> TourOptionNode {
    
    let node = TourOptionNode(text)
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 0.65),
      height: ASDimension(unit: .points, value: 55)
    )
    
    return node
    
  }
  
  class func priceNode(_ text: String) -> TourPriceNode {
    
    let node = TourPriceNode(text)
    
    node.size.height = ASDimension(unit: .points, value: 29)
    node.style.flexGrow = 1.0
    
    return node
    
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    
    let stack = VerticalStack()
    
    stack.addElement(locationImageNode)
    
    let tagsStack = HorizontalStack()
    
    tagsStack.flexWrap = .wrap
    tagsStack.spacing = 10
    tagsStack.lineSpacing = 10
    
    for tag in info.tags {
      
      tagsStack.addElement(DiscoverTableCellTagNode(tag))
      
    }
    
    tagsStack.style.spacingBefore = 24
    stack.addElement(tagsStack)
    
    flightTitleNode.style.spacingBefore = 45
    stack.addElement(flightTitleNode)
    
    let flightStack = HorizontalStack(aligned: .none, .center)
    
    flightDepartureNode.style.spacingAfter = -5
    flightDepartureNode.style.spacingBefore = 0
    flightStack.addElement(flightDepartureNode)
    
    flightArrowsNode.style.spacingAfter = -5
    flightArrowsNode.style.spacingBefore = -5
    flightStack.addElement(flightArrowsNode)
    
    flightDestinationNode.style.spacingBefore = -5
    flightDestinationNode.style.spacingAfter = 0
    flightStack.addElement(flightDestinationNode)
    
    flightStack.style.spacingBefore = 10
    stack.addElement(flightStack)
    
    departureTitleNode.style.spacingBefore = 27
    stack.addElement(departureTitleNode)
    
    let summaryStack = HorizontalStack(aligned: .none, .center)
    
    let departureStack = VerticalStack()
    
    departureStack.addElement(departureTimeNode)
    
    backDepartureTitleNode.style.spacingBefore = 27
    departureStack.addElement(backDepartureTitleNode)
    
    backDepartureTimeNode.style.spacingBefore = 10
    departureStack.addElement(backDepartureTimeNode)
    
    summaryStack.addElement(departureStack)
    
    departureArrowNode.style.spacingBefore = 1
    summaryStack.addElement(departureArrowNode)
    
    let priceStack = VerticalStack(aligned: .middle, .none)
    
    priceTitleNode.style.spacingBefore = -29
    priceStack.addElement(priceTitleNode)
    
    priceNode.style.spacingBefore = 10
    priceStack.addElement(priceNode)
    
    priceStack.style.spacingBefore = 7
    summaryStack.addElement(priceStack)
    
    summaryStack.style.spacingBefore = 10
    stack.addElement(summaryStack)
    
    changeDateButtonNode.style.spacingBefore = 22
    stack.addElement(changeDateButtonNode)
    
    hotelTitleNode.style.spacingBefore = 45
    stack.addElement(hotelTitleNode)
    
    hotelImageNode.style.spacingBefore = 10
    stack.addElement(hotelImageNode)
    
    hotelNameNode.style.spacingBefore = 20
    stack.addElement(hotelNameNode)
    
    changeHotelButtonNode.style.spacingBefore = 27
    stack.addElement(changeHotelButtonNode)
    
    orderButtonNode.style.spacingBefore = 30
    stack.addElement(orderButtonNode)
    
    return ASInsetLayoutSpec(
      insets: UIEdgeInsets(top: 45, left: 30, bottom: 45, right: 30),
      child: stack
    )
    
  }
  
}
