import SwiftUI

struct TermItem: View {
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

struct TermItem_Previews: PreviewProvider {
    static var previews: some View {
        TermItem(term: "percolate", definition: "to make coffee", source: "The Coffee Song", example: "You'll meet a girl and find out later / she smells just like a percolator.")
    }
}
