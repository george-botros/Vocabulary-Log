import SwiftUI
import CoreServices.DictionaryServices

struct TermItem: View {
    @State var term: String
    @State var definition: String
    var source: String
    var example: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Term", text: $term)
                    //.frame(minWidth: 10, idealWidth: 50, maxWidth: 60)
                    .fixedSize()
                TextEditor(text: $definition)
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
    }
}

struct TermItem_Previews: PreviewProvider {
    static var previews: some View {
        TermItem(term: "Percolate", definition: "(of a liquid or gas) filter.", source: "wikipedia.com", example: "You'll meet a girl and find out later / she smells just like a percolator.")
    }
}

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
