//
//  ViewController.swift
//  FirstApp
//
//  Created by Daniel Suskevic on 23/11/2017.
//  Copyright © 2017 Daniel Suskevic. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var tableView: UITableView!
    
    var readPermissionsArray : [String] = ["user_about_me", "user_posts"]
    var writePermissionsArray : [String] = ["publish_actions"]
    var graphPath : String = "me/feed"
    var requestParameter : [String: String] = ["fields":"likes, message"]
    var httpMethod : [String] = ["GET", "POST"]
    
    override func viewDidLoad() {
    }
    
    func setPermissions() {  // can't do in other class, can't do in instance error bad acess, cant do in class function error
        loginButton.readPermissions = readPermissionsArray
        //loginButton.publishPermissions = writePermissionsArray
    }
    
    func executeActions() {
        setPermissions()
        present(Alert.alert(alertMessage: "Connecting"), animated: true, completion:nil)
        RequestDataFromFB.requestData(graphPath: graphPath, requestParameter: requestParameter, httpMethod: httpMethod[0]) {
            self.dismissAlert()
            self.tableView.reloadData()
        }
    }
    
    @IBAction func reloadButtonTapped(_ sender: Any) {
        executeActions()
    }
    
    func dismissAlert() {
        self.presentedViewController?.dismiss(animated: false, completion: nil)
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        executeActions()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }
}

//MARK: Table View
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewCell.ArrayID.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "dataCell", for: indexPath) as! TableViewCell

        cell.idCell.text = TableViewCell.ArrayID[indexPath.row]
        cell.postCell.text = TableViewCell.ArrayPost[indexPath.row]
        
        return cell
    }
}
