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
        //callRESTtestWith_dataTaskWithRequest()
        
        
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
        print("callServiceToRegister")
        
        //let sURL:NSURL = NSURL(string: "http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register")!; // register
        let sURL:NSURL = NSURL(string: "http://hztb-dev.us-east-1.elasticbeanstalk.com/user/ping")!; // ping
        
        let session:NSURLSession = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: sURL)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        //let paramString = "mobileNumber=11479874489" // register
        let paramString = "mobileNumber=11479874489&imei=dummyimei" // ping
        
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var dataTask:NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data:NSData?, response:NSURLResponse?, error:NSError?) in
            print("json data")
            do {
                print("do")
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as!NSDictionary
                // use jsonData
                print(" ==================== SUCCESS ==================== ")
                NSLog("%@", jsonData)
                print(" ==================== / SUCCESS ==================== ")
            } catch {
                print(" ==================== ERROR ==================== ")
                print(error)
                print(" ==================== / ERROR ==================== ")
            }
        }
        
        // finally call this
        dataTask.resume()
        //
    }
    
    // Test API call
    private func callRESTtestWith_dataTaskWithUrl(){
        // uses : dataTaskWithUrl
        //
        // http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register
        // { "mobileNumber" : "18479874489" }
        // 1. https://httpbin.org/get
        // 2. http://jsonplaceholder.typicode.com/
        
        print("callRESTtestWith_dataTaskWithUrl")
        
        let sURL:NSURL = NSURL(string: "https://httpbin.org/get")!; // works fine
        //let sURL:NSURL = NSURL(string: "http://jsonplaceholder.typicode.com/posts")!; // not working
        // let sURL:NSURL = NSURL(string: "http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register")!; // actual call
        
        //let sURL:NSURL = NSURL(string: "http://hztb-dev.us-east-1.elasticbeanstalk.com/user/register")!;
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
    // REST call with POST
    private func callRESTtestWith_dataTaskWithRequest(){
        // uses : dataTaskWithRequest
        print("callRESTtestWith_dataTaskWithRequest")
        
        let sURL:NSURL = NSURL(string: "https://httpbin.org/post")!; // post - request
        let session:NSURLSession = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: sURL)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        let paramString = "data=Hello"
        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        var dataTask:NSURLSessionDataTask = session.dataTaskWithRequest(request) { (data:NSData?, response:NSURLResponse?, error:NSError?) in
            print("json data")
            do {
                print("do")
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as!NSDictionary
                // use jsonData
                NSLog("%@", jsonData)
            } catch {
                // report error
                print("ERROR")
            }
        }
        
        // finally call this
        dataTask.resume()
        //
    }

}
