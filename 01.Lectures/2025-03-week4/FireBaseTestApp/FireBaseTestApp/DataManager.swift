import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var apples: [Apple] = []
    
    init() {
        fetchApples()
    }
    
    func fetchApples() {
        apples.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Apples")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let name = data["name"] as! String
                    let id = data["id"] as! String
                    
                    let apple = Apple(id: id, name: name)
                    self.apples.append(apple)
                }
            }
        }
    }
    func addApple(name: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Apples")
        let newAppleId = UUID().uuidString
        ref.document(newAppleId).setData([
            "id": newAppleId,
            "name": name
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            }
        }
    }
}
