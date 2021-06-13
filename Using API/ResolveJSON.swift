//
//  ResolveJSON.swift
//  Using API
//
//  Created by Sachin Kashyap on 12/06/21.
//

import Foundation

class ResolveJSON: ObservableObject {
    
    @Published var posts = [Posts]()
    
    func fetchData() {
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([Posts].self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results
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
