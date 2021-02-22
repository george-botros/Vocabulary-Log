//
//  Term.swift
//  Vocabulary-Log
//
//  Created by Patrick Botros on 2/14/21.
//

import Foundation

public struct Term: Codable, Identifiable {
    var word: String
    var exampleSentence: String
    var url: String
    public var id = UUID()
}

typealias Terms = [Term]

extension Array: RawRepresentable where Element == Term {
    public init?(rawValue: String) {
        print(rawValue)
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        print(result)
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            print("blue")
            return "[]"
        }
        print("yellow")
        return result
    }
}
