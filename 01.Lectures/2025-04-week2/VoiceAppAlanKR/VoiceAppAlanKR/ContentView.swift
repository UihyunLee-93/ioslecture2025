import SwiftUI

struct ContentView: View {
    @StateObject var recognizer = SpeechRecognizer()
    @ObservedObject var classifier = ImageClassifierViewModel.shared
    @State private var showPicker = false

    var body: some View {
        VStack(spacing: 20) {
            Text("이스트소프트 Alan 음성 인터페이스 실습")
                .font(.title2)

            if let image = classifier.lastSelectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
            }

            Button("이미지 선택") {
                showPicker = true
            }
            
            // 임시 버튼 추가
            Button("분류 테스트") {
                classifier.classify { result in
                    print("테스트 결과:", result)
                    TTSManager.shared.speak(result)
                }
            }

            Button("음성 명령 시작") {
                recognizer.start()
                handleCommand("이미지 분류해줘")  // Simul에서 마이크 안됨. 직접 명령 호출
            }

            Button("음성 멈추기 및 명령 실행") {
                recognizer.stop()
                handleCommand(recognizer.transcript)
            }

            Text("명령어: \(recognizer.transcript)")
                .foregroundColor(.gray)
                .padding()

            Text(classifier.resultText)
        }
        .sheet(isPresented: $showPicker) {
            ImagePicker(image: $classifier.lastSelectedImage)
        }
    }

    func handleCommand(_ command: String) {
        AlanService.shared.sendCommand(command) { reply in
            if command.contains("분류") {
                classifier.classify { result in
                    TTSManager.shared.speak(result)
                }
            } else {
                TTSManager.shared.speak(reply ?? "잘 이해하지 못했어요.")
            }
        }
    }
}

#Preview {
    ContentView()
}
