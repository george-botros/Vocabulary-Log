// https://fivestars.blog/swiftui/app-scene-storage.html
import Foundation
import Combine

private var cancellableSet: Set<AnyCancellable> = []
//let defaults = UserDefaults.init(suiteName: "L27L4K8SQU.Vocabulary-Log")

extension Published where Value: Codable {
  init(wrappedValue defaultValue: Value, _ key: String, store: UserDefaults? = nil) {
    // let _store: UserDefaults = store ?? defaults!

    if let data = defaults!.data(forKey: key),
       let value = try? JSONDecoder().decode([Term].self, from: data) {
        print("hi")
        print(value)
        print(Value.self)
        self.init(initialValue: value as! Value)
    } else {
        print("hey")
      self.init(initialValue: defaultValue)
    }
    
    

    projectedValue
      .sink { newValue in
        let data = try? JSONEncoder().encode(newValue)
        print(newValue)
        print(data!)
        defaults!.set(data, forKey: key)
      }
      .store(in: &cancellableSet)
  }
}
