import AVFoundation

class TTSManager {
    static let shared = TTSManager()
    private let synthesizer = AVSpeechSynthesizer() // 단일 인스턴스

    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utterance)
    }
}
