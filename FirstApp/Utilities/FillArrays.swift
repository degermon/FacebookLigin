//
//  FillArrays.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 18/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import Foundation

class FillArrays {
    
    static func fillArrays() {
        TableViewCell.ArrayID.removeAll() // clean arrays
        TableViewCell.ArrayPost.removeAll()
        for item in SortDataFromFB.mostPopularPosts {
            TableViewCell.ArrayID.append(item.id)
            if item.message != nil {
                TableViewCell.ArrayPost.append(item.message!)
            } else {
                TableViewCell.ArrayPost.append(" ")
            }
        }
    }
}
