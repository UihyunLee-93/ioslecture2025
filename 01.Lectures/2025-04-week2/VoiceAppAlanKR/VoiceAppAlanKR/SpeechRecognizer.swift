import Foundation
import Speech
import AVFoundation

class SpeechRecognizer: NSObject, ObservableObject, SFSpeechRecognizerDelegate {
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "ko-KR"))
    private let audioEngine = AVAudioEngine()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    @Published var transcript: String = ""

    override init() {
        super.init()
        recognizer?.delegate = self
    }

    /// 음성 인식 권한 요청 후 시작
    func requestAuthorizationAndStart() {
        SFSpeechRecognizer.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.start()
                case .denied:
                    print("❌ 음성 인식 권한이 거부되었습니다.")
                case .restricted:
                    print("❌ 이 디바이스에서는 음성 인식을 사용할 수 없습니다.")
                case .notDetermined:
                    print("❌ 음성 인식 권한 상태가 결정되지 않았습니다.")
                @unknown default:
                    print("❌ 알 수 없는 권한 상태")
                }
            }
        }
    }

    /// 음성 인식 시작
    func start() {
        stop() // 기존 인식 중단

        #if targetEnvironment(simulator)
        print("⚠️ 시뮬레이터에서는 음성 인식이 지원되지 않습니다.")
        return
        #endif

        guard let recognizer = recognizer else {
            print("❌ SFSpeechRecognizer 초기화 실패")
            return
        }

        guard recognizer.isAvailable else {
            print("❌ 음성 인식기를 사용할 수 없습니다. (isAvailable == false)")
            return
        }

        if recognizer.supportsOnDeviceRecognition == false {
            print("⚠️ 이 디바이스는 로컬 음성 인식을 지원하지 않습니다.")
        }

        request = SFSpeechAudioBufferRecognitionRequest()
        guard let request = request else { return }

        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .measurement, options: .defaultToSpeaker)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("❌ 오디오 세션 설정 실패:", error.localizedDescription)
            return
        }

        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)

        guard recordingFormat.sampleRate != 0 && recordingFormat.channelCount != 0 else {
            print("❌ 샘플레이트/채널 수가 유효하지 않음")
            return
        }

        inputNode.removeTap(onBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.request?.append(buffer)
        }

        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("❌ 오디오 엔진 시작 실패:", error.localizedDescription)
            return
        }

        recognitionTask = recognizer.recognitionTask(with: request) { result, error in
            if let result = result {
                DispatchQueue.main.async {
                    self.transcript = result.bestTranscription.formattedString
                }
            }

            if let error = error {
                print("⚠️ 인식 오류:", error.localizedDescription)
            }
        }

        print("🎙️ 음성 인식 시작됨")
    }

    /// 음성 인식 중지
    func stop() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        request?.endAudio()
        recognitionTask?.cancel()
        recognitionTask = nil
        request = nil
        print("🛑 음성 인식 중단됨")
    }
}
