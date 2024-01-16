//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Abdulla Ahmad on 1/16/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollower(for username: String, page: Int, complited: @escaping([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complited(nil, "This username create an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                complited(nil,"Unable to complete your request. Please check your internet connection.")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complited(nil, "Invalid response from the server. Please try again.")
                return
            }
            
            guard let data = data else {
                complited(nil, "The data recived from server was invalid, Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                complited(followers, nil)
            } catch {
                complited(nil, "The data recived from server was invalid, Please try again.")
            }
        }
        
        task.resume()
    }
}
