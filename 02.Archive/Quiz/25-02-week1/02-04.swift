import Foundation
var words: [String] = []

// 5개의 단어 입력받아 배열에 저장
print("5개의 단어를 입력하세요:")
for _ in 1...5 {
    if let inputStr = readLine(), !inputStr.isEmpty {
        words.append(inputStr)
    }
}

// 입력한 단어 목록 출력
print("입력한 단어 목록: \(words)")

// 삭제할 단어 입력
print("삭제할 단어를 입력하세요:", terminator: " ")
if let deleteWord = readLine() {
    if let index = words.firstIndex(of: deleteWord) { 
        words.remove(at: index) // 특정 단어 삭제
        print("\(deleteWord) 단어가 삭제되었습니다.")
    } else {
        print("\(deleteWord) 단어를 찾을 수 없습니다.")
    }
}

// 최종 배열 출력
print("최종 단어 목록: \(words)")


    

