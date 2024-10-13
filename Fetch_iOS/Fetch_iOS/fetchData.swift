//
//  fetchData.swift
//  Fetch_iOS
//
//  Created by Sri Laxmi Prasanna on 10/12/24.
//

import Foundation

struct Item: Codable,Hashable {
    let id: Int
    let listId: Int
    let name: String?
}

func fetchData(completion: @escaping ([Item]?) -> Void) {
    guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json")
    else { return }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, error == nil else {
            completion(nil)
            return
        }
        
        do {
            let items = try JSONDecoder().decode([Item].self, from: data)
            completion(items)
        } catch {
            completion(nil)
        }
    }.resume()
}


