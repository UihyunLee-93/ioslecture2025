import CreateML
import Foundation

// 1. 학습 데이터 디렉토리 경로 (각 클래스별 폴더 포함)
let dataURL = URL(fileURLWithPath: "/Users/uihyun/Documents/ioslecture2025/01.Lectures/2025-04-week2/ImageClassifierBuilder/ImageClassifierBuilder/MyTrainingData")

do {
    // 2. 이미지 분류 데이터셋 로딩 (라벨은 폴더 이름 기준 자동 분류)
    let data = try MLImageClassifier.DataSource.labeledDirectories(at: dataURL)

    // 3. 학습 설정 구성 (선택 사항: epoch, augmentation 등 설정 가능)
    let parameters = MLImageClassifier.ModelParameters(
        featureExtractor: .scenePrint(revision: 1),
        validationData: nil,
        maxIterations: 10,
        augmentationOptions: [.flip, .crop] // 기본적인 데이터 증가
    )

    // 4. 이미지 분류기 학습
    let classifier = try MLImageClassifier(trainingData: data, parameters: parameters)

    // 5. 모델 평가 결과 출력
    let evaluation = classifier.trainingMetrics
    let accuracy = (1.0 - evaluation.classificationError) * 100
    print("✅ Training Accuracy: \(String(format: "%.2f", accuracy))%")

    // 6. 모델 저장
    let outputURL = URL(fileURLWithPath: "/Users/uihyun/Documents/ioslecture2025/01.Lectures/2025-04-week2/ImageClassifierBuilder/ImageClassifierBuilder/FountainClassifier.mlmodel")
    try classifier.write(to: outputURL)

    print("✅ 모델 생성 완료: \(outputURL.path)")

} catch {
    print("❌ 오류 발생: \(error.localizedDescription)")
}
