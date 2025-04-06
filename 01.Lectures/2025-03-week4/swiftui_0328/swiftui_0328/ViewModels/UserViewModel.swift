import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published private(set) var users: [UserData] = []
    
    func addUser(name: String){
        let newUser = UserData(id: <#UUID#>, name: name)
        users.append(newUser)
    }
    
    
}
