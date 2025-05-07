import SwiftUI

struct ContentView: View {
    @StateObject private var speechRecognizer = SpeechRecognizer()
    @State private var recognizedText = ""
    @State private var alanResponse = ""
    @State private var isListening = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Alan 음성 대화 앱")
                .font(.title)
                .bold()

            Text("인식된 명령: \(recognizedText)")
                .padding()

            Text("Alan 응답: \(alanResponse)")
                .padding()

            if isListening {
                Text("🎙️ 인식 중입니다... 말씀해 주세요")
                    .foregroundColor(.red)
                    .font(.headline)
            }

            Button(action: {
                if isListening {
                    // 🔴 인식 종료
                    speechRecognizer.stopRecording()
                    isListening = false
                    print("🛑 인식 종료")
                } else {
                    // 기존 음성 출력 중단
                    TTSManager.shared.stop()

                    // 인식 시작
                    isListening = true
                    print("🎙️ 인식 시작")
                    speechRecognizer.startRecording { text in
                        recognizedText = text

                        // 특수 명령어 조건 추가 가능 (예: "날씨"가 포함되었을 때 별도 API 호출 등)
                        if text.contains("한글") {
                            AlanService.shared.send(text: "오늘 중랑구 온도 알려줘") { response in
                                DispatchQueue.main.async {
                                    alanResponse = response
                                    TTSManager.shared.speak(response)
                                }
                            }
                        } else {
                            AlanService.shared.send(text: text) { response in
                                DispatchQueue.main.async {
                                    alanResponse = response
                                    TTSManager.shared.speak(response)
                                }
                            }
                        }
                    }
                }
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isListening ? Color.red : Color.blue)
                    .frame(height: 50)
                    .overlay(
                        Text(isListening ? "인식 종료" : "음성 명령")
                            .foregroundColor(.white)
                            .bold()
                    )
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
