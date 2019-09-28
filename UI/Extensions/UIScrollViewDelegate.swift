//
//  UIScrollViewDelegate.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import AsyncDisplayKit

extension ASTableNode: UIScrollViewDelegate {
  
  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    view.endEditing(false)
    
  }
  
}

extension ASCollectionNode: UIScrollViewDelegate {
  
  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    view.endEditing(false)
    
  }
  
}

extension ASScrollNode: UIScrollViewDelegate {
  
  open func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    view.endEditing(false)
    
  }
  
}
