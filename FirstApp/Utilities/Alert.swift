//
//  Alert.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 18/12/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit

class Alert {
    class func alert(alertMessage: String) -> UIAlertController { // allert function
        let alertController = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
        }
        alertController.addAction(OKAction)
        return alertController
        //present(alertController, animated: true, completion:nil)
    }
}
