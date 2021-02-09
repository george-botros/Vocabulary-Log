//
//  SafariExtensionHandler.swift
//  Vocabulary-Log-Extension
//
//  Created by George Botros on 2/8/21.
//

import SafariServices

let defaults = UserDefaults.init(suiteName: "L27L4K8SQU.Vocabulary-Log")!

struct Term: Codable {
    var word: String
    var exampleSentence: String
    var url: String
}

class SafariExtensionHandler: SFSafariExtensionHandler {

    override func contextMenuItemSelected(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil) {

        // Turn the userInfo from page into a Term object.
        let word = userInfo!["term"] as! String
        let exampleSentence = userInfo!["exampleSentence"] as! String
        let url = userInfo!["url"] as! String
        let term = Term(word: word, exampleSentence: exampleSentence, url: url)

        // This will run if no current log exists.
        if defaults.object(forKey: "terms") == nil {
            let encoder = JSONEncoder()
            if let firstWordDict = try? encoder.encode([term]) {
                defaults.set(firstWordDict, forKey: "terms")
            }
        }

        // Decode current log into a dictionary. -
        let decoder = JSONDecoder()
        var vocabularyLog = try? decoder.decode([Term].self, from: defaults.object(forKey: "terms") as! Data)
        
        // Append the new Term to the dictionary.
        vocabularyLog?.append(term)

        // Reencode and save the dictionary
        let encoder = JSONEncoder()
        if let appendedDictionary = try? encoder.encode(vocabularyLog) {
            defaults.set(appendedDictionary, forKey: "terms")
        }

    }

}
