import Foundation
import Vision
import CoreML
import UIKit

class ImageClassifierViewModel: ObservableObject {
    static let shared = ImageClassifierViewModel()

    @Published var resultText = "분류 결과 없음"
    @Published var lastSelectedImage: UIImage?

    private var vnModel: VNCoreMLModel?

    private init() {
        if let model = try? MobileNetV2(configuration: MLModelConfiguration()).model {
            vnModel = try? VNCoreMLModel(for: model)
            
            print(">>>>> MobileNetV2가 정상적으로 로드 됨.")
        }
    }

    func classify(completion: @escaping (String) -> Void) {
        print("classify() 함수 호출됨")

        guard let image = lastSelectedImage ?? UIImage(named: "sample") else {
            print("이미지 없음")
            DispatchQueue.main.async {
                self.resultText = "이미지가 선택되지 않았고 샘플 이미지도 없습니다."
                completion("이미지 없음")
            }
            return
        }

        print("이미지 준비됨: \(image.size)")

        guard let ciImage = CIImage(image: image),
              let vnModel = vnModel else {
            print("이미지 변환 실패 또는 모델 없음")
            completion("변환 실패")
            return
        }

        let request = VNCoreMLRequest(model: vnModel) { req, _ in
            if let result = req.results?.first as? VNClassificationObservation {
                let resultText = "\(result.identifier): \(String(format: "%.1f", result.confidence * 100))%"
                DispatchQueue.main.async {
                    self.resultText = resultText
                    completion(resultText)
                }
            } else {
                print("분류 실패")
                completion("분류 실패")
            }
        }

        let handler = VNImageRequestHandler(ciImage: ciImage)
        try? handler.perform([request])
    }
}
