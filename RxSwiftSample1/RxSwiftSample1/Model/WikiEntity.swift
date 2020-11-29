//
//  WikiEntity.swift
//  RxSwiftSample1
//
//  Created by hiroshi on 2020/11/29.
//

import Foundation

struct WikiEntity: Decodable {
    let query: Query?
}

struct Query: Decodable {
    let search: [Search]
}

struct Search: Decodable {
    let title: String
    let pageid: Int
}
