//
//  DashboardTableViewCell.swift
//  ToggleStatusBar2
//
//  Created by Ethan Neff on 1/28/16.
//  Copyright © 2016 Ethan Neff. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var subtitle: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.separatorInset = UIEdgeInsetsZero
    self.layoutMargins = UIEdgeInsetsZero
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
