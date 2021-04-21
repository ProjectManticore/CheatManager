//
//  APIHandler.swift
//  CheatManager
//
//  Created by Luca on 21.04.21.
//

import Foundation

class CMAPIEndpoints {
    // Root Address to CheatManager Backend API
    let Root: String = "http://192.168.178.126:8000"
    
    // Endpoints
    let getFeaturedCheats: String = "/store/featured"
}

class CMAPI {
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
}
