//
//  AHJson.swift
//  JSON Request
//
//  Created by Aaqib Hussain on 26/02/2016.
//  Copyright © 2016 Aaqib Hussain. All rights reserved.
//

import Foundation

class AHJson {
    
    
    
    //CompletiomHandler returns data in case of success and error in case of failure

    
    //For POST request
    internal static func postRequest(url:String, parameters:String,completionHandler: ((AnyObject!, NSError!) -> Void)!)
    {
        
        let url:NSURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        
        
        request.HTTPBody = parameters.dataUsingEncoding(NSUTF8StringEncoding)
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        
        
        let task = session.dataTaskWithRequest(request){
            data, response,  error in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                do {
                    
                    var json: AnyObject!
                    
                    let receivedData = NSString(data: data!, encoding: NSUTF8StringEncoding)! as String
                  
                    let itemIndex  = receivedData.startIndex
                    let itemAtIndex =  receivedData[itemIndex]
                    
                    if (error != nil) {
                       
                        return completionHandler(nil, error)
                    } else {
                        if  itemAtIndex == "["   {
                            json = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.MutableContainers) as! NSArray
                            
                            
                            return completionHandler(json as! [NSArray], nil)
                        }
                        else if itemAtIndex == "{" {
                            json = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                            return completionHandler(json as! NSDictionary, nil)
                        }
                    }
                } catch {
                    print("found nil")
                    return
                }
                
                
                
            })
        }
        
        task.resume()
        
    }
    
    
    
    //For GET Request
    internal static func getRequest(url:String,completionHandler: ((AnyObject!, NSError!) -> Void)!)
    {
        
       
        let url:NSURL = NSURL(string: url)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"

        
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        
        
        let task = session.dataTaskWithRequest(request){
            data, response,  error in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
               
                
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                

                


                do {
                    
                var json: AnyObject!
                   
                   let receivedData = NSString(data: data!, encoding: NSUTF8StringEncoding)! as String
                    
                    let itemIndex  = receivedData.startIndex
                    let itemAtIndex =  receivedData[itemIndex]
                    
                    
                    
                    if (error != nil) {
                   
                        return completionHandler(nil, error)
                    } else {
                        if  itemAtIndex == "["   {
                            json = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.MutableContainers) as! NSArray
                            
                            
                        return completionHandler(json as! [NSArray], nil)
                        }
                        else if itemAtIndex == "{" {
                    json = try NSJSONSerialization.JSONObjectWithData(data!,options:NSJSONReadingOptions.MutableContainers) as! NSDictionary
                        return completionHandler(json as! NSDictionary, nil)
                        }
                    }
                } catch {
                   print("found nil")
                    return
                }
                
                
                
            })
            
        }
        
        task.resume()
        
    }
    





}
