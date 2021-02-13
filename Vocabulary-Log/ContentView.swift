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

        HStack {
            Text("Vocabulary Log")
                .font(Font.custom("SF Compact Rounded", size: 33))
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
                .padding(.init(top: 15, leading: 20, bottom: -0.5, trailing: 0))
            Spacer()
        }
        
        List {
            ForEach(vocabularyLog ?? [], id: \.word) { term in
                TermItem(term: term.word, definition: "hamsamsa", source: "google.com", example: term.exampleSentence)
                Divider()
            }
        }
        .toolbar(content: {
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus")
            })
        })
        .frame(minWidth: 450, minHeight: 450)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
