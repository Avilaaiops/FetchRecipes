//
//  Persistence.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

public protocol Persistence {
    func store<T: Encodable>(_ object: T, as fileName: String)
    func retrieve<T: Decodable>(_ fileName: String, as type: T.Type) -> T
}
