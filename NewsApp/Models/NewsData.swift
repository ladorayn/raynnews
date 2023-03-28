//
//  NewsData.swift
//  NewsApp
//
//  Created by Lado Rayhan on 28/03/23.
//

import Foundation

struct Results: Decodable {
    let articles: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return _id
    }
    let _id: String
    let title: String
    let link: String?
}
