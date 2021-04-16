//
//  NetworkHandler.swift
//  Helselia
//
//  Created by evelyn on 2021-02-27.
//

import Foundation
import SwiftUI

let debug = true

public class requests {
    enum requestTypes {
        case GET
        case POST
        case PATCH
        case DELETE
        case PUT
    }
}

#warning("todo: strip this more")

public class NetworkHandling {
    func jsonRequest(url: String, token: String, Cookie: String, json: Bool, type: requests.requestTypes, bodyObject: [String:Any]) -> [[String:Any]] {
        var completion: Bool = false
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: (URL(string: url) ?? URL(string: "#"))!)
        var retData: Data = Data()
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
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue(Cookie, forHTTPHeaderField: "Cookie")
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
                if data != Data() {
                    do {
                        returnArray = try JSONSerialization.jsonObject(with: data ?? Data(), options: .mutableContainers) as? [[String:Any]] ?? [[String:Any]]()
                    } catch {
                        print("error at serializing: \(error.localizedDescription)")
                    }
                } else {
                    returnArray = [["Code":statusCode]]
                }
                if debug {
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                }
            }
            else {
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        if type == .GET {
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
                    print("returned properly \(Date())")
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
                print("URL Session Task Failed: %@", error!.localizedDescription);
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
            }
        }
    }
}
