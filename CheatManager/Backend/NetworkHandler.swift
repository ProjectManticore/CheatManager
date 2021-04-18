//
//  NetworkHandler.swift
//  CheatManager
//
//  Created by evelyn on 2021-02-27.
//

import Foundation
import SwiftUI

let debug = false

public class requests {
    enum requestTypes {
        case GET
        case POST
        case PATCH
        case DELETE
        case PUT
    }
}

// example
// jsonRequest(url: <url as string of json>, json: <use bodyObject or not>, type <GET, POST, PATCH or PUT>, bodyObject: <Array for POST request>)

public class NetworkHandling {
    func jsonRequest(url: String, json: Bool, type: requests.requestTypes, bodyObject: [String:Any]) -> [[String:Any]] {
        var completion: Bool = false
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: (URL(string: url) ?? URL(string: "#"))!)
        var retData: Data = Data()
        var offline: Bool = false
        switch type {
        case .GET:
            request.httpMethod = "GET"
        case .POST:
            request.httpMethod = "POST"
        case .PATCH:
            request.httpMethod = "PATCH"
        case .DELETE:
            request.httpMethod = "DELETE"
        case .PUT:
            request.httpMethod = "PUT"
        }
        if type == .POST {
            request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])
        }
        var returnArray: [[String:Any]] = []
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                print("success \(Date())")
                let statusCode = (response as! HTTPURLResponse).statusCode
                retData = Data(data!)
                if let data = data {
                    do {
                        returnArray = try JSONSerialization.jsonObject(with: data , options: .mutableContainers) as? [[String:Any]] ?? [[String:Any]]()
                    } catch {
                        print("error at serializing: \(error.localizedDescription)")
                    }
                    print(data)
                } else {
                    returnArray = [["Code":statusCode]]
                }
                if debug {
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                }
            }
            else {
                if debug == true {
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                }
                print("we're offline. stopping here the asynchronation action")
                offline = true
            }
        })
        if type == .GET && offline == false {
            print("starting \(Date())")
            while completion == false {
                task.resume()
                session.finishTasksAndInvalidate()
                if retData != Data() {
                    print("none yet : \(Date())")
                    do {
                        returnArray = try JSONSerialization.jsonObject(with: retData, options: .mutableContainers) as? [[String:Any]] ?? [[String:Any]]()
                    } catch {
                        print("error at serializing: \(error.localizedDescription)")
                    }
                    completion = true
                    print("returned properly \(Date()) \(returnArray)")
                    return returnArray
                }
            }
        } else {
            task.resume()
            session.finishTasksAndInvalidate()
            sleep(1)
            return returnArray
        }
    }
	
    func dataRequest(url: String, json: Bool, bodyObject: [String:Any]) -> Data {
        var completion: Bool = false
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: (URL(string: url) ?? URL(string: "#"))!)
        var retData: Data = Data()
        var offline: Bool = false
        request.httpMethod = "GET"
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                print("success \(Date())")
                let statusCode = (response as! HTTPURLResponse).statusCode
                retData = Data(data!)
                if debug {
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                }
            }
            else {
                if debug == true {
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                }
                offline = true
                print("we're offline. stopping here the asynchronation action")
            }
        })
        // garbage completion handling, very sorry
        print("starting \(Date())")
        while completion == false {
            if retData != Data() {
                completion = true
                print("returned properly \(Date())")
                return retData
            } else {
                sleep(1)
                task.resume()
                session.finishTasksAndInvalidate()
                if offline == true {
                    return retData
                }
            }
        }
    }
}
