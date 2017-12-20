//
//  RequestDataFromFB.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 15/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class RequestDataFromFB {
    
    class func requestData(graphPath: String, requestParameter : [String: String], httpMethod: String, completion: @escaping ()->(Void)) {
        if ((FBSDKAccessToken.current()) != nil) {
            let request : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: graphPath, parameters: requestParameter, httpMethod: httpMethod)
            
            request.start { (connection, result, error) -> Void in
                if error == nil {
                    if httpMethod == "GET" {
                        SortDataFromFB.sortData(result: result as Any)
                        completion()
                    }
                } else {
                    print(error as Any)
                }
            }
        }
    }
}
