//
//  Vocabulary_LogApp.swift
//  Vocabulary-Log
//
//  Created by George Botros on 2/8/21.
//

import SwiftUI

@main
struct Vocabulary_LogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vocabularyLog: try! JSONDecoder().decode([Term].self, from: defaults!.object(forKey: "terms") as! Data))
        }.windowStyle(HiddenTitleBarWindowStyle())
    }
}
