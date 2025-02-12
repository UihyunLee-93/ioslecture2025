import SwiftUI

struct ContentView: View {
    @State private var selectedAnswer: String = ""
    @State private var feedbackMessage: String = ""

    let correctAnswer = "for i in 1...10 where i % 2 != 0 {"

    var body: some View {
        VStack {
            Text("다음 1부터 10까지 홀수를 출력하는 예시 코드입니다. 코드에서 빈칸을 채우세요.")
                .font(.headline)
                .padding()

            Text("""
            ______ i in 1...10 where i % 2 != 0 {
                print(i)
            }
            """)
            .font(.system(size: 20, weight: .bold, design: .monospaced))
            .padding()

            Picker("정답을 선택하세요", selection: $selectedAnswer) {
                Text("for").tag("for")
                Text("while").tag("while")
                Text("if").tag("if")
            }
            .pickerStyle(.segmented)
            .padding()

            Button("제출하기") {
                if selectedAnswer == "for" {
                    feedbackMessage = "✅ 정답입니다!"
                } else {
                    feedbackMessage = "❌ 오답입니다. 다시 시도하세요!"
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            Text(feedbackMessage)
                .font(.title2)
                .padding()
        }
        .padding()
    }
}
#Preview{
    ContentView()
}
