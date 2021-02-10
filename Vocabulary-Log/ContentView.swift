import SwiftUI

let defaults = UserDefaults.init(suiteName: "L27L4K8SQU.Vocabulary-Log")

struct Term: Codable {
    var word: String
    var exampleSentence: String
    var url: String
}


struct ContentView: View {
    
    @AppStorage("terms", store: defaults) var vocabularyLogAsData = Data()
    var body: some View {
        let vocabularyLog = try? JSONDecoder().decode([Term].self, from: vocabularyLogAsData)
        List {
            ForEach(vocabularyLog!, id: \.word) { term in
                TermItem(term: term.word, definition: "def", source: "source", example: term.exampleSentence)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
