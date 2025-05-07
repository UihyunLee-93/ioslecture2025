import Foundation
import UIKit
import CoreML

class ImageClassifierViewModel: ObservableObject {
    @Published var resultText = "예측 결과 없음"
    @Published var selectedImage: UIImage?

    private let model: FountainClassifier

    init() {
        do {
            self.model = try FountainClassifier(configuration: MLModelConfiguration())
        } catch {
            fatalError("모델 로딩 실패: \(error.localizedDescription)")
        }
    }

    func classify(image: UIImage) {
        guard let pixelBuffer = image.pixelBuffer(width: 224, height: 224) else {
            self.resultText = "이미지 변환 실패"
            return
        }

        do {
            let prediction = try model.prediction(image: pixelBuffer)
            let probabilities = prediction.targetProbability

            // 확률 내림차순 정렬하여 상위 3개 선택
            let topResults = probabilities.sorted { $0.value > $1.value }.prefix(3)

            // 출력 문자열 구성
            let resultLines = topResults.map { (label, prob) in
                return "\(label): \(String(format: "%.1f", prob * 100))%"
            }

            DispatchQueue.main.async {
                self.resultText = "예측 결과:\n" + resultLines.joined(separator: "\n")
            }
        } catch {
            self.resultText = "예측 실패: \(error.localizedDescription)"
        }

    }
}
