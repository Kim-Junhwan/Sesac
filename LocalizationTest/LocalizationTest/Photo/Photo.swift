//
//  Photo.swift
//  LocalizationTest
//
//  Created by JunHwan Kim on 2023/09/12.
//

import Foundation

struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]?
}

struct PhotoResult: Codable {
    let id: String
    let created_at: String
    let description: String?
    let urls: PhotoURL
    let links: PhotoLink
    let likes: Int
    let user: PhotoUser
}

struct PhotoURL: Codable {
    let full: String
    let thumb: String
}

struct PhotoLink: Codable {
    let html: String
}

struct PhotoUser: Codable {
    let username: String
}

class APIService {
    
    static let shared = APIService()
    
    private let key = "UtiGgK8CyvHlis4zHLfMN2D4F6wzhVSbYYJZctVrhlI"
    
    private init() { }
    
    func searchPhoto(query: String, completion: @escaping (Photo?) -> Void ) {
    
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(key)") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Photo.self, from: data!)
                completion(result)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
}
