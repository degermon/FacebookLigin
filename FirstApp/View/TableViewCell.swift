//
//  TableViewCell.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 18/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var idCell: UILabel!
    @IBOutlet weak var postCell: UILabel!
    
    static var ArrayID : [String] = []
    static var ArrayPost : [String] = []
}
