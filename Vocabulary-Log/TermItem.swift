import SwiftUI
import CoreServices.DictionaryServices

struct TermItem: View {
    @State var term: String
    @State var preferredDefinition: String?
    @State var definitions: [Definition]?
    var source: String
    var example: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Term", text: $term)
                    .onChange(of: term, perform: { _ in
                        Api().define(word: term) { (results) in
                            definitions = results?.first?.meanings.first?.definitions ?? []
                        }
                    })
                    .fixedSize()
                // TextField("Definition", text: $definition)
                Picker("Select", selection: self.$preferredDefinition) {
                    ForEach(definitions ?? [], id: \.definition) { definition in
                        Text(definition.definition)
                    }
                }
            }
            Text("\""+example+"\"")
            HStack {
                Image(systemName: "safari")
                Text(source)
            }.padding(5)
            .background(Color.gray)
            .cornerRadius(6)
        }
        .background(Color.init("mg"))
        .cornerRadius(8)
        .onAppear {
            Api().define(word: term) { (results) in
                definitions = results?.first?.meanings.first?.definitions ?? []
            }
        }
    }
}

struct TermItem_Previews: PreviewProvider {
    static var previews: some View {
        TermItem(term: "Percolate", source: "wikipedia.com", example: "You'll meet a girl and find out later / she smells just like a percolator.")
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
