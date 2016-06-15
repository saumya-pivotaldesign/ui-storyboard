//
//  VCRegistration.swift
//  HZTB
//
//  Created by Pivotal on 6/14/16.
//  Copyright © 2016 pivotaldesign.biz. All rights reserved.
//

import UIKit

class VCRegistration: UIViewController {
    
    @IBOutlet var uName:UITextField!
    @IBOutlet var uPass:UITextField!
    @IBOutlet var uEmail:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Storyboard actions
    @IBAction func onRegistrationClick(sender:AnyObject){
        print("TODO: registration call")
        print(uName.text)
        print(uPass.text)
        print(uEmail.text)
        
        callServiceToRegister()
        
        
    }
    
    private func dictionaryToQueryString(dict: [String : String]) -> String {
        var parts = [String]()
        for (key, value) in dict {
            let part: String = key + "=" + value
            parts.append(part);
        }
        return parts.joinWithSeparator("&")
    }
    
    //MARK: REST call
    private func callServiceToRegister(){
        // http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register
        // { "mobileNumber" : "18479874489" }
        // 1. https://httpbin.org/get
        // 2. http://jsonplaceholder.typicode.com/
        
        print("callServiceToRegister")
        
        //let sURL:NSURL = NSURL(string: "https://httpbin.org/get")!; // works fine
        //let sURL:NSURL = NSURL(string: "http://jsonplaceholder.typicode.com/posts")!; // not working
        // let sURL:NSURL = NSURL(string: "http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register")!; // actual call
        
        let sURL:NSURL = NSURL(string: "http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register")!;
        //var err: NSError?
        
        let session:NSURLSession = NSURLSession.sharedSession()
        var dataTask:NSURLSessionDataTask = session.dataTaskWithURL(sURL) { (data:NSData?, response:NSURLResponse?, error:NSError?) in
            //var json:NSDictionary = NSJSONSerialization.dataWithJSONObject(data!, options: 0)
            //NSLog("%@", json)
            //
            print("json data")
            
            do {
                print("Success")
                
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as!NSDictionary
                // use jsonData
                
                NSLog("%@", jsonData)
            } catch {
                // report error
                print("ERROR")
            }
            //
        }
        // finally call this
        dataTask.resume()
        //
    }




}
