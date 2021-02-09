//
//  ContentView.swift
//  Vocabulary-Log
//
//  Created by George Botros on 2/8/21.
//

import SwiftUI

let defaults = UserDefaults.init(suiteName: "L27L4K8SQU.Vocabulary-Log")

struct Term: Codable {
    var word: String
    var exampleSentence: String
    var url: String
}

struct ContentView: View {
    
    var vocabularyLog: [Term]
    var body: some View {
        let window = NSScreen.main?.visibleFrame
        List {
            ForEach(vocabularyLog, id: \.word) {
                term in
                TermView(term: term.word, definition: "hi", source: "source", example: term.exampleSentence)
            }
            
        }.onAppear {
            let vocabularyLog = try? JSONDecoder().decode([Term].self, from: defaults!.object(forKey: "terms") as! Data)
        }
        .frame(width: window!.width-500, height: window?.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.init("bg"))
        //.background(BlurWindow())
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vocabularyLog: [Term(word: "hi", exampleSentence: "howdy", url: "hey")])
    }
}

struct TermView: View {
    var term: String
    var definition: String
    var source: String
    var example: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(term + ":")
                    .padding(3)
                    .foregroundColor(.black)
                    .background(Color.yellow)
                    .cornerRadius(3)
                Text(definition).offset(x: -3)
                Spacer()
            }
            Text(source).italic().padding(.leading, 30)
            Text(example).padding(.leading, 10)
        }.padding()
        .background(Color.init("mg"))
        .cornerRadius(8)
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
    }
}

var gray = Color.gray.opacity(1)

struct BlurWindow: NSViewRepresentable {

    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }

    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
    }
}
