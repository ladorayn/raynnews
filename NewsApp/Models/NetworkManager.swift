//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Lado Rayhan on 28/03/23.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://api.newscatcherapi.com/v2/latest_headlines?countries=ID") {
            var request = URLRequest(url: url)
            request.addValue("YkzBJnwtvY_9-CaiAqkThY3zEoJOhiWKcUSEed6gI3o", forHTTPHeaderField: "x-api-key")
            request.httpMethod = "GET"
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.articles
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

