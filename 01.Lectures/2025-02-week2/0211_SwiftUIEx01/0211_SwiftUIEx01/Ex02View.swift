import SwiftUI

struct Ex02View: View {
    var body: some View {
        VStack {
            Image("Space")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .background(Color.gray)
            
        }
        .padding()
    }
}
#Preview {
    Ex02View()
}
