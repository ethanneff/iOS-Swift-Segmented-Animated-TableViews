//
//  FirstTableViewController.swift
//  SegmentedTableViews
//
//  Created by Ethan Neff on 1/30/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
  var data = ["Cheese", "Pepperoni", "Black Olives"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // register custom cell
    let nib = UINib(nibName: "DashboardTableViewCell", bundle: nil)
    self.tableView.registerNib(nib, forCellReuseIdentifier: "cell")
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // set custom cell
    let cell: DashboardTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! DashboardTableViewCell
    cell.title.text = data[indexPath.row]
    cell.subtitle.text = "topping"
    
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
}
