import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var userHome: String = ""
    @ObservedObject private var viewModel = CarViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("사용자 이름", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                TextField("사는 곳", text: $userHome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Button("서버에서 자동차 정보 가져오기") {
                    viewModel.fetchCarData(user: username, home: userHome)
                }
                .padding()

                if let error = viewModel.errorMessage {
                    Text("오류: \(error)").foregroundColor(.red)
                }

                if let user = viewModel.userData {
                    Text("사용자: \(user.user), 지역: \(user.home)")
                        .font(.headline)
                        .padding(.top)
                }

                List(viewModel.carList) { car in
                    VStack(alignment: .leading) {
                        Text("\(car.name) (\(car.company))")
                            .font(.headline)
                        Text("가격: \(car.price) / 연식: \(car.year)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("자동차 목록")
        }
    }
}
