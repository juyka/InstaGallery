//
//  RequestManager.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

class RequestManager {
    
    func sendRequest(url url: NSURL, completion: (JSON?, NSError?) -> ()) {
        
        let completeOnMain: (JSON?, NSError?) -> () = onMain(completion)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            
            if let data = data {
                
                if let responseObject = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) {
                    let json = JSON.Object(responseObject)
                    completeOnMain(json, nil)
                }
                else {
                    completeOnMain(nil, NSError(domain: "NSJSONSerialization error", code: 1, userInfo: nil))
                }
            }
            else {
                completeOnMain(nil, error)
            }
        }
        
        task.resume()
    }
}
