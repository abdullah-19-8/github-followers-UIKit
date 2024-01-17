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
    
    func getFollower(for username: String, page: Int, complited: @escaping(Result<[Follower], ErrorMessage>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            complited(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                complited(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complited(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complited(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                complited(.success(followers))
            } catch {
                complited(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}