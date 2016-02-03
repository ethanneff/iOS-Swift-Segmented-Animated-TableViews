//
//  ViewController.swift
//  ToggleStatusBar2
//
//  Created by Ethan Neff on 1/28/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
  // MARK: properties
  @IBOutlet weak var containerHabits: UIView!
  @IBOutlet weak var containerGoals: UIView!
  @IBOutlet weak var containerMotives: UIView!
  var containerCurrentIndex: Int!
  var containerCurrentView: UIView!
  
  // MARK: load
  override func viewDidLoad() {
    super.viewDidLoad()
    defaultContainers()
  }
  
  func defaultContainers() {
    // hide containers
    containerGoals.hidden = true
    containerMotives.hidden = true
    containerHabits.hidden = false
    containerCurrentView = containerHabits
    containerCurrentIndex = 0
    // fix spacing issue with containers
    self.automaticallyAdjustsScrollViewInsets = false
  }
  
  // MARK: segment navigation
  @IBAction func segmentValueChange(segment: UISegmentedControl) {
    switch segment.selectedSegmentIndex {
    case 0:
      navigateContainer(container: containerHabits, index: segment.selectedSegmentIndex)
      break
    case 1:
      navigateContainer(container: containerGoals, index: segment.selectedSegmentIndex)
      break
    case 2:
      navigateContainer(container: containerMotives, index: segment.selectedSegmentIndex)
      break
    default:
      break
    }
  }
  
  func animateContainer(prevX prevX: CGFloat, nextX: CGFloat, nextContainer: UIView) {
    UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.containerCurrentView.frame.origin.x = prevX
      nextContainer.frame.origin.x = nextX
      }, completion: { (success) -> Void in
        self.unloadContainer()
    })
  }
  
  func navigateContainer(container container: UIView, index: Int) {
    loadContainer()
    
    if index < containerCurrentIndex {
      // left
      container.frame.origin.x = 0 - container.frame.size.width
      self.containerCurrentView.frame.origin.x = 0
      container.hidden = false
      
      animateContainer(prevX: container.frame.size.width, nextX: 0, nextContainer: container)
    } else if index > containerCurrentIndex {
      // right
      self.containerCurrentView.frame.origin.x = 0
      container.frame.origin.x = container.frame.size.width
      container.hidden = false
      
      animateContainer(prevX: 0 - self.containerCurrentView.frame.width, nextX: 0, nextContainer: container)
    }
    
    // set previous
    containerCurrentView = container
    containerCurrentIndex = index
  }
  
  func loadContainer() {
    
  }
  
  func unloadContainer() {
    
  }
}
