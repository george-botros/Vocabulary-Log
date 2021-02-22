import SwiftUI

let defaults = UserDefaults.init(suiteName: "L27L4K8SQU.Vocabulary-Log")

struct ContentView: View {

    class ContentViewModel: ObservableObject {
      @Published("terms") var vocabularyLog = Terms()
    }
    @StateObject var model = ContentViewModel()

    var body: some View {
        HStack {
            Text("Vocabulary Log")
                .font(Font.custom("SF Compact Rounded", size: 33))
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
                .padding(.init(top: 15, leading: 20, bottom: -0.5, trailing: 0))
            Spacer()
        }
        
        List {
            ForEach(model.vocabularyLog, id: \.id) { term in
                TermItem(term: term.word, source: "google.com", example: term.exampleSentence)
                Divider()
            }
        }.onAppear {
            print(model.vocabularyLog)
            print(model.vocabularyLog.first)
        }
        // .onDeleteCommand(perform: vocabularyLog?.remove(at: 1))
        .toolbar(content: {
            Spacer()
            Button(action: {
                print(model.vocabularyLog)
                print(model.vocabularyLog.first)
                /* let encoder = JSONEncoder()
                model.vocabularyLog.append(Term(word: "word", exampleSentence: "lol", url: "lmfao"))
                if let appendedDictionary = try? encoder.encode(model.vocabularyLog) {
                    print("j")
                    defaults?.set(appendedDictionary, forKey: "terms")
                } else {
                    print("failed")
                } */
            }, label: {
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
