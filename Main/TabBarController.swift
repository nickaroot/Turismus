//
//  TabBarController.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class TabBarController: ASTabBarController {
  
  fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let discoverNavigation = ASNavigationController(rootViewController: DiscoverController())
    
    discoverNavigation.tabBarItem = UITabBarItem(title: "", image: Asset.Main.tabBarDiscover.image, tag: 1)
    discoverNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    
    let progressNavigation = ASNavigationController(rootViewController: UIViewController())
    
    progressNavigation.tabBarItem = UITabBarItem(title: "", image: Asset.Main.tabBarProgress.image, tag: 1)
    progressNavigation.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    
    setViewControllers([discoverNavigation, progressNavigation], animated: false)
    
    if #available(iOS 13, *) {

      let appearance = self.tabBar.standardAppearance.copy()
      
      appearance.backgroundImage = UIImage()
      appearance.shadowImage = UIImage()
      appearance.shadowColor = .clear
        
      tabBar.standardAppearance = appearance
      
    } else {
      
      tabBar.shadowImage = UIImage()
      tabBar.backgroundImage = UIImage()
      tabBar.backgroundColor = .clear
      
    }
    
    tabBar.tintColor = .main
    tabBar.barTintColor = .white
    tabBar.isTranslucent = false
    
    tabBar.clipsToBounds = false
    
    tabBar.layer.shadowColor = UIColor(displayP3Red: 0.93, green: 0.91, blue: 1.0, alpha: 1).cgColor
    tabBar.layer.shadowRadius = 14
    tabBar.layer.shadowOpacity = 0.45
    tabBar.layer.shadowOffset = CGSize(width: 0, height: -4)
    
  }
  
  override func viewWillLayoutSubviews() {
    
      super.viewWillLayoutSubviews()

      let newTabBarHeight = defaultTabBarHeight + 35

      var newFrame = tabBar.frame
      newFrame.size.height = newTabBarHeight
      newFrame.origin.y = view.frame.size.height - newTabBarHeight

      tabBar.frame = newFrame
  }
  
}
