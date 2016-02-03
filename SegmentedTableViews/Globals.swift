//
//  Globals.swift
//  ToggleStatusBar2
//
//  Created by Ethan Neff on 1/26/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
  // load
  override public func viewDidLoad() {
    super.viewDidLoad()
    self.navigationBar.barTintColor = UIColor.whiteColor()
  }
}

extension UITableViewController {
  // properties
  private struct AssociatedKeys {
    static var refreshControl:UIRefreshControl?
  }
  
  var guid: UIRefreshControl? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.refreshControl) as? UIRefreshControl
    }
    set {
      if let newValue = newValue {
        objc_setAssociatedObject(self, &AssociatedKeys.refreshControl, newValue as UIRefreshControl?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
      }
    }
  }
  
  // load
  override public func viewDidLoad() {
    super.viewDidLoad()
    
    // borders
    self.tableView.contentInset = UIEdgeInsetsZero
    self.tableView.separatorInset = UIEdgeInsetsZero
    self.tableView.layoutMargins = UIEdgeInsetsZero
    
    // refresh
    self.refreshControl = UIRefreshControl()
    self.refreshControl!.attributedTitle = NSAttributedString(string: "Refresh")
    self.refreshControl!.addTarget(self, action: "startRefresh:", forControlEvents: UIControlEvents.ValueChanged)
    self.tableView.addSubview(refreshControl!)
    self.edgesForExtendedLayout = .None
  }
  
  // refresh
  func startRefresh(sender:AnyObject) {}
  
  func stopRefresh(sender:AnyObject) {
    self.refreshControl!.endRefreshing()
  }
}