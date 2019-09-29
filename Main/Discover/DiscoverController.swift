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
  
  let info = [
    DiscoverTableCellNode.Info(
      text: "Франция — Париж",
      imageURL: "https://www.istitutomarangoni.com/wp-content/uploads/2017/03/xPARIS_1600X900.jpg.pagespeed.ic.KzPIqCynII.jpg",
      tags: [
        DiscoverTableCellTagNode.Tag("от 23 000 ₽",
          tintColor: UIColor(displayP3Red: 0.93, green: 0.91, blue: 1, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("7 дней",
          tintColor: UIColor(red: 1, green: 0.92, blue: 0.86, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("Можно завтра",
          tintColor: UIColor(red: 0.87, green: 1, blue: 0.86, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("Тёплый климат",
          tintColor: UIColor(red: 1, green: 0.91, blue: 0.97, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("Нужна виза",
          tintColor: UIColor(red: 0.83, green: 0.97, blue: 1, alpha: 1)
        ),
      ]
    ),
    DiscoverTableCellNode.Info(
      text: "Франция — Лион",
      imageURL: "https://gdb.rferl.org/EF78DAC3-92A6-4E9A-BC78-2E075880163D_cx0_cy14_cw0_w1023_r1_s.jpg",
      tags: [
        DiscoverTableCellTagNode.Tag("от 54 000 ₽",
          tintColor: UIColor(displayP3Red: 0.93, green: 0.91, blue: 1, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("12 дней",
          tintColor: UIColor(red: 1, green: 0.92, blue: 0.86, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("Через 8 часов",
          tintColor: UIColor(red: 1, green: 0.86, blue: 0.87, alpha: 1)
        ),
      ]
    ),
    DiscoverTableCellNode.Info(
      text: "Франция — Марсель",
      imageURL: "https://lifeglobe.net/x/entry/9658/1.jpg",
      tags: [
        DiscoverTableCellTagNode.Tag("от 23 000 ₽",
          tintColor: UIColor(displayP3Red: 0.93, green: 0.91, blue: 1, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("7 дней",
          tintColor: UIColor(red: 1, green: 0.92, blue: 0.86, alpha: 1)
        ),
        DiscoverTableCellTagNode.Tag("Можно завтра",
          tintColor: UIColor(red: 1, green: 0.86, blue: 0.87, alpha: 1)
        ),
      ]
    ),
  ]
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    
    return .default
    
  }
  
  var keyboardObserver: (NSObjectProtocol, NSObjectProtocol)?
  
  init() {
    
    super.init(node: DiscoverNode())
    
  }
  
  override func viewDidLoad() {
    
    navigationController?.setNavigationBarHidden(true, animated: false)
    
    node.tableNode.delegate = self
    node.tableNode.dataSource = self
    
    node.topBarNode.searchButtonNode.touchUpInsideBlock = { [weak self] _ in
      
      ServiceLayer.cityAutocomplete(term: ServiceLayer.CityAutocomplete(
        term: self?.node.topBarNode.searchFieldNode.attributedText?.string ?? "")) { (success, error) in
        
          debugPrint(error)
        
      }
      
    }
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
      
      keyboardObserver = Keyboard.subscribe(self,
        willShow: keyboardWillShow(notification:),
        willHide: keyboardWillHide(notification:)
      )
      
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      
      Keyboard.unsubscribe(keyboardObserver)
      
    }
  
  required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
  func pushTour(_ info: DiscoverTableCellNode.Info) {
    
    let tourController = TourController(info)
    
    navigationController?.pushViewController(tourController, animated: true)
    
  }
  
}
