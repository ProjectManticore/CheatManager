//
//  APIHandler.swift
//  CheatManager
//
//  Created by Luca on 21.04.21.
//

import Foundation

class CMAPIEndpoints {
    // Root Address to CheatManager Backend API
    let Root: String = "http://192.168.178.126:1337"
    
    // Endpoints
    let getFeaturedCheats:  String = "/store/featured"
    let upvoteCheat:        String = "/upvote/"             // params: id
    let downvoteCheat:      String = "/downvote/"           // params: id
    let searchByBundleID:   String = "/search/bundle/"      // params: bundle_id
    let searchByAuthor:     String = "/search/author/"      // params: author
}

class CMAPI {
    func sendPostJSON(jsonBody: [String: Any], endpoint: String, completion: @escaping (Data) -> ()) {
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody)
        let url = URL(string: (CMAPIEndpoints().Root + endpoint))!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
        .resume()
    }
    
    func getFeaturedCheats(completion: @escaping (FeaturedCheatsResponse) -> ()) {
        guard let url = URL(string: CMAPIEndpoints().Root + CMAPIEndpoints().getFeaturedCheats) else { return }
        print(url.absoluteString)
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let featuredCheats = try! JSONDecoder().decode(FeaturedCheatsResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(featuredCheats)
            }
        }
        .resume()
    }
    
    func upvoteCheat() {
        // TODO
    }
    
    func downvoteCheat() {
        // TODO
    }
    
    func searchByBundleID(BundleID: String, completion: @escaping (FeaturedCheatsResponse) -> ()) {
        guard let url = URL(string: (CMAPIEndpoints().Root + CMAPIEndpoints().searchByBundleID + BundleID)) else { return }
        print(url.absoluteString)
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let searchResultCheats = try! JSONDecoder().decode(FeaturedCheatsResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(searchResultCheats)
            }
        }
        .resume()
    }
    
    func searchByAuthor(Author: String, completion: @escaping (FeaturedCheatsResponse) -> ()) {
        guard let url = URL(string: (CMAPIEndpoints().Root + CMAPIEndpoints().searchByAuthor + Author)) else { return }
        print(url.absoluteString)
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let searchResultCheats = try! JSONDecoder().decode(FeaturedCheatsResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(searchResultCheats)
            }
        }
        .resume()
    }
    
    
}
