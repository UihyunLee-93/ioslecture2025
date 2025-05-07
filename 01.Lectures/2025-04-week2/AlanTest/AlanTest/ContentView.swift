import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var result = ""
    private let cclientID = UUID().uuidString
    var body: some View {
        VStack(spacing: 20) {
            TextField("질문을 입력하세요", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("질문 보내기") {
                AlanService.shared.sendCommand(<#T##userText: String##String#>, completion: <#T##(String?) -> Void#>)(content: input) { reply in
                    result = reply
                    TTSManager.shared.speak(reply)
                }
            }

            Text("응답: \(result)")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
