//
//  AuthNode.swift
//  Turismus
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit
import UI
import Assets

class AuthNode: ASDisplayNode {
  
  let coverNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .fraction, value: 1),
      height: ASDimension(unit: .points, value: 244)
    )
    
    node.contentMode = .scaleAspectFill
    node.image = Asset.Auth.authCover.image
    
    return node
    
  }()
  
  let logoNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 205),
      height: ASDimension(unit: .points, value: 26)
    )
    
    node.contentMode = .center
    node.image = Asset.Auth.authLogo.image
    
    return node
    
  }()
  
  let boyMemojiNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 109),
      height: ASDimension(unit: .points, value: 109)
    )
    
    node.contentMode = .center
    node.image = Asset.Auth.boyMemoji.image
    
    return node
    
  }()
  
  let girlMemojiNode: ASImageNode = {
    
    let node = ASImageNode()
    
    node.size = ASLayoutSize(
      width: ASDimension(unit: .points, value: 109),
      height: ASDimension(unit: .points, value: 109)
    )
    
    node.contentMode = .center
    node.image = Asset.Auth.girlMemoji.image
    
    return node
    
  }()
  
  let signInForm: AuthSignInNode = {
    
    let node = AuthSignInNode()
    
    node.size.width = ASDimension(unit: .fraction, value: 1)
    node.style.flexGrow = 1.0
    node.style.flexShrink = 1.0
    
    node.backgroundColor = .white
    
    node.border = Border(radius: 30)
    
    return node
    
  }()
  
  override init() {
    
    super.init()
    
    automaticallyManagesSubnodes = true
    
  }
  
  override func animateLayoutTransition(_ context: ASContextTransitioning) {
    
    UIView.animate(withDuration: Keyboard.animationTime, animations: {
      
      self.frame.origin.y = Keyboard.isShown ? -210 : 0
      
    }, completion: { context.completeTransition($0) })
    
  }
  
}
