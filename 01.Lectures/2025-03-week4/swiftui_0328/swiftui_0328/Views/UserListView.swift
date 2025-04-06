import SwiftUI

struct UserListView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var newName: String = ""
    
    var body: some View {
        Text("Heello")
    }
}


#Preview {
    UserListView()
}
