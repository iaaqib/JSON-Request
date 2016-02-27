//
//  ViewController.swift
//  JSON Request
//
//  Created by Aaqib Hussain on 26/02/2016.
//  Copyright © 2016 Aaqib Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var request = AHJson()
    var array : NSMutableArray = []
    var data : NSMutableArray = []
    //json object
    var horoscope = "http://a.knrz.co/horoscope-api/current/leo"
    //json array
    var get = "http://a.knrz.co/horoscope-api/archive/2015/32"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AHJson.getRequest(horoscope) { (data, error) -> Void in
           
            
                print("Sign:\(data!["sign"]!!)");
                print("Prediction:\(data!["prediction"]!!)");
                print("Week:\(data!["week"]!!)");
            
            
            
            
        }
        
        
        AHJson.getRequest(get){(data,error)
            -> Void in
            for (var i = 0 ; i < data.count ; i++)
            {
                
                print("Sign:\(data![i]["sign"]!!)");
                print("Prediction:\(data![i]["prediction"]!!)");
                print("Week:\(data![i]["week"]!!)");
                
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

