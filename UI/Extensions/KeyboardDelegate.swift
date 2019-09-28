//
//  KeyboardDelegate.swift
//  UI
//
//  Created by Nikita Arutyunov on 28.09.2019.
//  Copyright © 2019 Nikita Arutyunov. All rights reserved.
//

import UIKit
import AsyncDisplayKit

public protocol KeyboardDelegate: class {
  
  func keyboardDidChange()
  
}

extension KeyboardDelegate {
  
  public func keyboardWillShow(notification: Notification) {
    
    guard let userInfo = notification.userInfo else { return }
    
    guard let animationTime =
      (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue else { return }
    
    guard let height =
      (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else { return }
    
    Keyboard.isShown = true
    Keyboard.animationTime = animationTime
    Keyboard.height = height
    
    keyboardDidChange()
    
  }
  
  public func keyboardWillHide(notification: Notification) {
    
    guard let userInfo = notification.userInfo else { return }
    
    guard let animationTime =
      (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue else { return }
    
    guard let height =
      (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height else { return }
    
    Keyboard.isShown = false
    Keyboard.animationTime = animationTime
    Keyboard.height = height
    
    keyboardDidChange()
    
  }
  
}

open class Keyboard: UIResponder {
  
  public static var isShown = false
  
  public static var animationTime = Double(0)
  public static var height = CGFloat(0)
  
  public static func subscribe(_ view: Any?, willShow: @escaping (Notification) -> Void,
                               willHide: @escaping (Notification) -> Void) -> (NSObjectProtocol, NSObjectProtocol)? {
    
    guard let view = (view as? ASViewController<ASDisplayNode>)?.view else { return nil }
    
    view.addGestureRecognizer(UITapGestureRecognizer({ view.endEditing(false) }))
    
    let willShowObserver = NotificationCenter.default.addObserver(
      forName: UIResponder.keyboardWillShowNotification,
      object: nil,
      queue: nil,
      using: willShow
    )
    
    let willHideObserver = NotificationCenter.default.addObserver(
      forName: UIResponder.keyboardWillHideNotification,
      object: nil,
      queue: nil,
      using: willHide
    )
    
    return (willShowObserver, willHideObserver)
    
  }
  
  public static func unsubscribe(_ observer: (NSObjectProtocol, NSObjectProtocol)?) {
    
    guard let observer = observer else { return }
    
    NotificationCenter.default.removeObserver(observer.0)
    NotificationCenter.default.removeObserver(observer.1)
    
  }
  
}
