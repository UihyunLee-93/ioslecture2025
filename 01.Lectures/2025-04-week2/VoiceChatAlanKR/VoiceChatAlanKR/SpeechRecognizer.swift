import AVFoundation
import Speech
import SwiftUI

class SpeechRecognizer: ObservableObject {
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))
    private let audioEngine = AVAudioEngine()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    func startRecording(completion: @escaping (String) -> Void) {
        // 시뮬레이터 예외 처리
        #if targetEnvironment(simulator)
        print("⚠️ 시뮬레이터에서는 음성 인식이 작동하지 않습니다.")
        return
        #endif

        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized:
                    self.startAudioSession(completion: completion)
                default:
                    print("❌ 음성 인식 권한이 거부되었습니다.")
                }
            }
        }
    }

    private func startAudioSession(completion: @escaping (String) -> Void) {
        request = SFSpeechAudioBufferRecognitionRequest()
        guard let request = request else {
            print("❌ Recognition Request 생성 실패")
            return
        }

        recognitionTask?.cancel()
        recognitionTask = nil

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .measurement, options: .defaultToSpeaker)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("❌ 오디오 세션 설정 실패: \(error.localizedDescription)")
            return
        }

        let inputNode = audioEngine.inputNode
        let format = inputNode.outputFormat(forBus: 0)

        inputNode.removeTap(onBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            self.request?.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("❌ audioEngine 시작 실패: \(error.localizedDescription)")
            return
        }

        recognitionTask = recognizer?.recognitionTask(with: request) { result, error in
            if let result = result, result.isFinal {
                self.stopRecording()
                completion(result.bestTranscription.formattedString)
            } else if let error = error {
                print("🎤 음성 인식 오류: \(error.localizedDescription)")
                self.stopRecording()
            }
        }
    }

    func stopRecording() {
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        request?.endAudio()
        recognitionTask?.cancel()
        recognitionTask = nil
        request = nil
    }
}

