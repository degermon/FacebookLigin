//
//  SortDataFromFB.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 15/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import Foundation

class SortDataFromFB {
    static var arrayOfInstances : [StoredData] = []
    static var numberOfPostsWithMostLikes : Int = 5
    static var mostPopularPosts: ArraySlice<StoredData> = []
    
    static func sortData(result: Any) {
        guard let data = result as? Dictionary<String, Any> else {
            return
        }
        
        guard let array = data["data"] as? Array<Dictionary<String, Any>> else {
            return
        }
        
        for item in array {
            let instance = StoredData()
            
            if let id = item["id"] as? String {
                instance.id = id
            }
            if let message = item["message"] as? String {
                instance.message = message
            }
            
            if let likes = item["likes"] as? Dictionary<String, Any>  {
                guard let array2 = likes["data"] as? Array<Dictionary<String, String>> else {
                    return
                }
                instance.numberOfLikes = array2.count
            }
            arrayOfInstances.append(instance)
        }
        
        mostPopularPosts = SpecifiedMostPopular.specifiedMostPopular(numberOfMostFopular: numberOfPostsWithMostLikes)
        FillArrays.fillArrays()
    }
}
