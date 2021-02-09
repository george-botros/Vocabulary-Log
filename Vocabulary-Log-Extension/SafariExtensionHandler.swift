//
//  SafariExtensionHandler.swift
//  Vocabulary-Log-Extension
//
//  Created by George Botros on 2/8/21.
//

import SafariServices

struct Term: Codable {
    var term: String
    var exampleSentence: String
    var url: String
}

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func contextMenuItemSelected(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil) {
        var term = Term(term: userInfo!["term"] as! String, exampleSentence: userInfo!["exampleSentence"] as! String, url: userInfo!["url"] as! String)
        page.dispatchMessageToScript(withName: "printToConsole", userInfo: ["exampleSentence": userInfo!["exampleSentence"]])
    }

}
