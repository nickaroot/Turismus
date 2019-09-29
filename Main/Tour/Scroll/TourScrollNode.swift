//
//  TourScrollNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 29.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class TourScrollNode: ASScrollNode {
  
  let locationImageNode: ASNetworkImageNode = {
    
    let node = ASNetworkImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 256)
    )
    
    node.border = Border(radius: 10)
    
    return node
    
  }()
  
  let flightTitleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .semibold),
      lineHeight: 24
    ))
    
    node.setAttributedText("Перелёт")
    
    return node
    
  }()
  
  let flightDepartureNode: TourOptionNode
  
  let flightArrowsNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 31),
      height: ASDimension(unit: .points, value: 31)
    )
    
    node.border = Border(radius: 31 / 2)
    node.backgroundColor = .white
    
    node.contentMode = .center
    node.image = Asset.Main.tourFlightArrows.image
    
    node.zPosition = 103
    
    return node
    
  }()
  
  let flightDestinationNode: TourOptionNode
  
  let departureTitleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1),
      font: .systemFont(ofSize: 16, weight: .regular),
      lineHeight: 19
    ))
    
    node.setAttributedText("Отправление")
    
    return node
    
  }()
  
  let departureTimeNode: TourOptionNode
  
  let backDepartureTitleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1),
      font: .systemFont(ofSize: 16, weight: .regular),
      lineHeight: 19
    ))
    
    node.setAttributedText("Возвращение")
    
    return node
    
  }()
  
  let backDepartureTimeNode: TourOptionNode
  
  let departureArrowNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 16),
      height: ASDimension(unit: .points, value: 40)
    )
    
    node.image = Asset.Main.tourDepartureArrow.image
    
    return node
    
  }()
  
  let priceTitleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: UIColor(red: 0.42, green: 0.42, blue: 0.42, alpha: 1),
      font: .systemFont(ofSize: 16, weight: .regular),
      lineHeight: 19
    ))
    
    node.setAttributedText("Цена")
    
    return node
    
  }()
  
  let priceNode: TourPriceNode
  
  let changeDateButtonNode: ButtonNode = {
    
    let node = ButtonNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 55)
    )
    
    node.border = Border(radius: 10)
    node.backgroundColor = UIColor(red: 0.93, green: 0.91, blue: 1, alpha: 1)
    
    node.titleNode.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .regular),
      lineHeight: 21
    ))
    node.titleNode.setAttributedText("Изменить дату начала")
    
    return node
    
  }()
  
  let hotelTitleNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .semibold),
      lineHeight: 24
    ))
    
    node.setAttributedText("Отель")
    
    return node
    
  }()
  
  let hotelImageNode: ASNetworkImageNode = {
    
    let node = ASNetworkImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 256)
    )
    
    node.border = Border(radius: 10)
    
    return node
    
  }()
  
  let hotelNameNode: TextNode = {
    
    let node = TextNode()
    
    node.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .semibold),
      lineHeight: 24
    ))
    
    node.setAttributedText("La Parle Franceifoiud")
    
    return node
    
  }()
  
  let changeHotelButtonNode: ButtonNode = {
    
    let node = ButtonNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 55)
    )
    
    node.border = Border(radius: 10)
    node.backgroundColor = UIColor(red: 0.93, green: 0.91, blue: 1, alpha: 1)
    
    node.titleNode.setAttributes(TextAttributes(
      color: .black,
      font: .systemFont(ofSize: 18, weight: .regular),
      lineHeight: 21
    ))
    node.titleNode.setAttributedText("Изменить отель")
    
    return node
    
  }()
  
  let orderButtonNode: ButtonNode = {
    
    let node = ButtonNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 55)
    )
    
    node.border = Border(radius: 10)
    node.backgroundColor = UIColor(red: 0.17, green: 0, blue: 1, alpha: 1)
    
    node.titleNode.setAttributes(TextAttributes(
      color: .white,
      font: .systemFont(ofSize: 18, weight: .regular),
      lineHeight: 21
    ))
    node.titleNode.setAttributedText("Оформить билеты")
    
    return node
    
  }()
  
  let info: DiscoverTableCellNode.Info
  
  init(_ info: DiscoverTableCellNode.Info) {
    
    self.info = info
    
    flightDepartureNode = TourScrollNode.flightOptionNode("Санкт-Петербург")
    flightDepartureNode.zPosition = 101
    flightDestinationNode = TourScrollNode.flightOptionNode("Франция")
    flightDestinationNode.zPosition = 102
    
    departureTimeNode = TourScrollNode.departureOptionNode("21 июля 2019 в 18:40")
    backDepartureTimeNode = TourScrollNode.departureOptionNode("29 июля 2019 в 16:20")
    
    priceNode = TourScrollNode.priceNode("12 000 ₽")
    
    super.init()
    
    automaticallyManagesSubnodes = true
    automaticallyManagesContentSize = true
    view.alwaysBounceVertical = true
    
    locationImageNode.setURL(
      URL(string: info.imageURL),
      resetToDefault: false
    )
    
    hotelImageNode.setURL( // FIXME
      URL(string: info.imageURL),
      resetToDefault: false
    )
    
  }
  
}
