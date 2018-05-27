//
//  AuthViewController.swift
//  alphatron
//
//  Created by Anna on 14.05.18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

struct Global {
    static let apiLink = "http://alphatron.schander-dev.art/API/"
    static let mediaLink = "http://alphatron.schander-dev.art"
    static var auth = true
    static var token = "e0be339948dd9d1a071ef8d15d5e5eb2d001585c"
    static var companyID = 1
    static var userID = 6
    static var shipNumber = 0
    static var fleet: [[String: Any]] = []
    static var changedFleet: [[String: Any]] = []
    static func valuesFromNL(key: String) -> String {
        switch (key) {
            case "Type of vessel":
                return self.changedFleet[self.shipNumber]["Type"] as! String
            case "Call Sign":
                return self.changedFleet[self.shipNumber]["CallSign"] as! String
            case "Gross Tonnage":
                return String(self.changedFleet[self.shipNumber]["GrossTonnage"] as? Int ?? 0)
            case "IMO":
                return String(self.changedFleet[self.shipNumber]["IMO"] as? Int ?? 0)
            case "MMSI":
                return self.changedFleet[self.shipNumber]["MMSI"] as! String
            case "Class":
                return self.changedFleet[self.shipNumber]["Class"] as! String
        default:
            return "p"
        }
    }
    static func changeFleetWithNL(key: String, value: String) -> Void {
        switch (key) {
        case "Type of vessel":
            self.changedFleet[self.shipNumber]["Type"] = value
        case "Call Sign":
            self.changedFleet[self.shipNumber]["CallSign"] = value
        case "Gross Tonnage":
            self.changedFleet[self.shipNumber]["GrossTonnage"] = Int(value)
        case "IMO":
            self.changedFleet[self.shipNumber]["IMO"] = Int(value)
        case "MMSI":
            self.changedFleet[self.shipNumber]["MMSI"] = value
        case "Class":
            self.changedFleet[self.shipNumber]["Class"] = value
        default:
            print("key not found")
        }
    }
    static let toSys: [String: String] = ["Type of vessel": "Type", "Call Sign": "CallSign", "Gross Tonnage": "GrossTonnage"]
}

class AuthViewController: UIViewController {
    
    func continueToFleet() -> Void {
        
        self.performSegue(withIdentifier: "toFleet", sender: self)
        
    }
    
//    func auth() {
//        let passMD5 = "098F6BCD4621D373CADE4E832627B4F6"
//        let link = Global.apiLink
//        let task = URLSession.shared.dataTask(with: URL(string: link)!) { (data, response, error) in
//            
//            if let content = data {
//                
//                do {
//                    let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
//                }
//                catch {
//                    print("err")
//                }
//                
//            }
//            else {
//                print("ERROR")
//            }
//            
//        }
////    }
    
    
    func onDataInsert() {
        if (login.text == "test@gmail.com") && (password.text == "test") {
            Global.auth = true
            continueToFleet()
        }
        else {
            let alert = UIAlertController(title: "Data incorrect!", message: "Ooops.. Check the data you have inserted. Here goes a mistake.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func afterLoginField(_ sender: Any) {
        print("he")
    }
    
    @IBAction func loginBut(_ sender: Any) {
        onDataInsert()
        password.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Global.auth = false
        //if Global.auth {
        //    continueToFleet()
        //}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Global.auth {
            continueToFleet()
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
