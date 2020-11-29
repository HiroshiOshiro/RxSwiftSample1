//
//  DataParser.swift
//  RxSwiftSample1
//
//  Created by hiroshi on 2020/11/29.
//

import Foundation
import APIKit

final class DataParser<T: Decodable>: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        // デコードする
        return try JSONDecoder().decode(T.self, from: data)
    }
}
