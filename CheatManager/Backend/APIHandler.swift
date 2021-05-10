//
//  APIHandler.swift
//  CheatManager
//
//  Created by Luca on 21.04.21.
//

import Foundation

class CMAPIEndpoints {
    // Root Address to CheatManager Backend API
    let Root: String = "https://cheatmanager-api-8ujov.ondigitalocean.app"
    
    // Endpoints
    let getFeaturedCheats:  String = "/store/featured"
    let upvoteCheat:        String = "/upvote/"             // params: id
    let downvoteCheat:      String = "/downvote/"           // params: id
    let searchByBundleID:   String = "/search/bundle/"      // params: bundle_id
    let searchByCategory:   String = "/search/category/"    // params: category
    let searchByAuthor:     String = "/search/author/"      // params: author
    
    // Auth
    let authGoogle:         String = "/auth/callback"      // params: code
}

class CMAPI {
    let userDefaults = UserDefaults.standard
    
    func sendPostJSON(jsonBody: [String: Any], endpoint: String, authRequired: Bool, completion: @escaping (Data) -> ()) {
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody)
        let url = URL(string: (CMAPIEndpoints().Root + endpoint))!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        if authRequired == true {
            if self.userDefaults.object(forKey: "token") == nil {
                // Development key
                self.userDefaults.setValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlZpc2xhdGUiLCJpYXQiOjE2MTkxMDYyNDgsImV4cCI6MTY1MDY0MjI0OH0.tJDE2dKLPNftT6QBrc_wF5xlS6KQf2pT3NzMZUWOxZk", forKey: "token")
                self.sendPostJSON(jsonBody: jsonBody, endpoint: endpoint, authRequired: authRequired, completion: completion)
            }else {
                request.setValue(self.userDefaults.string(forKey: "token"), forHTTPHeaderField: "token")
            }
        }
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
    
    func getFeaturedCheats(completion: @escaping (StandardCheatResponse) -> ()) {
        guard let url = URL(string: CMAPIEndpoints().Root + CMAPIEndpoints().getFeaturedCheats) else { return }
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if ((err?.localizedDescription.contains("Could not connect to the server.")) != nil) {
                // Server is down
            }
            
            let featuredCheats = try! JSONDecoder().decode(StandardCheatResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(featuredCheats)
            }
        }
        .resume()
    }
    
    func upvoteCheat(cheatID: String) {
        self.sendPostJSON(jsonBody: ["id": cheatID], endpoint: (CMAPIEndpoints().downvoteCheat + cheatID), authRequired: true) { (Data) in
            print(Data)
        }
    }
    
    func downvoteCheat(cheatID: String) {
        self.sendPostJSON(jsonBody: ["id": cheatID], endpoint: (CMAPIEndpoints().downvoteCheat + cheatID), authRequired: true) { (Data) in
            print(Data)
        }
    }
    
    func searchByBundleID(BundleID: String, completion: @escaping (StandardCheatResponse) -> ()) {
        guard let url = URL(string: (CMAPIEndpoints().Root + CMAPIEndpoints().searchByBundleID + BundleID)) else { return }
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if ((err?.localizedDescription.contains("Could not connect to the server.")) != nil) {
                // Server is down
            }
            
            let searchResultCheats = try! JSONDecoder().decode(StandardCheatResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(searchResultCheats)
            }
        }
        .resume()
    }
    
    func searchByCategory(Category: String, completion: @escaping (StandardCheatResponse) -> ()) {
        guard let url = URL(string: (CMAPIEndpoints().Root + CMAPIEndpoints().searchByCategory + Category)) else { return }
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if ((err?.localizedDescription.contains("Could not connect to the server.")) != nil) {
                // Server is down
            }
            
            let searchResultCheats = try! JSONDecoder().decode(StandardCheatResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(searchResultCheats)
            }
        }
        .resume()
    }
    
    func searchByAuthor(Author: String, completion: @escaping (StandardCheatResponse) -> ()) {
        guard let url = URL(string: (CMAPIEndpoints().Root + CMAPIEndpoints().searchByAuthor + Author)) else { return }
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if ((err?.localizedDescription.contains("Could not connect to the server.")) != nil) {
                // Server is down
            }
            
            let searchResultCheats = try! JSONDecoder().decode(StandardCheatResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(searchResultCheats)
            }
        }
        .resume()
    }
    
    func receiveGoogleAuthToken(withToken token: String, completion: @escaping (String) -> ()) {
        guard let url = URL(string: (CMAPIEndpoints().Root + CMAPIEndpoints().authGoogle + "?code=\(token.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")) else { return }
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if ((err?.localizedDescription.contains("Could not connect to the server.")) != nil) {
                // Server unreachable
            }
            
            let authRequestResponse = try! JSONDecoder().decode(StandarAuthResponse.self, from: data!)
            DispatchQueue.main.async {
                completion(authRequestResponse.data["access_token"]!)
            }
        }
        .resume()
    }
    
}
