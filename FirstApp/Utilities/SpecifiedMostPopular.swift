//
//  SpecifiedMostPopular.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 15/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import Foundation

class SpecifiedMostPopular {
    
    static func specifiedMostPopular(numberOfMostFopular: Int) -> ArraySlice<StoredData> {
        let array = SortDataFromFB.arrayOfInstances.sorted(by: { $0.numberOfLikes > $1.numberOfLikes })
        let postsWithMostsLikes = array.prefix(upTo: numberOfMostFopular)
        return postsWithMostsLikes
    }
}
