//
//  API.swift
//  Vocabulary-Log
//
//  Created by Patrick Botros on 2/13/21.
//

import Foundation

struct Response: Decodable {
    var word: String!
    var meanings: [Meaning]
}

struct Meaning: Decodable {
    var partOfSpeech: String
    var definitions: [Definition]
}

struct Definition: Decodable {
    var definition: String
}

class Api {
    func define(word: String, completion: @escaping ([Response]?)->() ) {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en_US/\(word)") else {
            print("invalid url")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, error) in
            if let data = data {
                print("1")
                if let decodedResponse = try? JSONDecoder().decode([Response].self, from: data) {
                    print("2")
                    DispatchQueue.main.async {
                        print(decodedResponse)
                        completion(decodedResponse)
                    }
                    return
                }
            }
            print("nil \(error?.localizedDescription)")
            completion(nil)
        }
        task.resume()
    }
}
