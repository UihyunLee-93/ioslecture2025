import SwiftUI

struct ContentView: View {
    @State private var words: [String] = ["사과","딸기","바나나"] // 단어 배열
    @State private var newWord: String = ""           // 새 단어 입력
    @State private var wordToDelete: String = ""      // 삭제할 단어 입력
    @State private var searchWord: String = ""        // 검색할 단어 입력
    @State private var message: String = ""           // 상태 메시지

    var body: some View {
        VStack {
            Text("Array 관리 프로그램")
                .font(.largeTitle)
                .padding()

            // 현재 단어 수 표시
            Text("현재 단어 수: \(words.count)개")
                .font(.subheadline)
                .padding(.bottom)

            // 단어 추가 섹션
            HStack {
                TextField("단어 입력", text: $newWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("추가") {
                    addWord()
                }
                .padding(.horizontal)
            }

            // 단어 목록 표시
            List(words, id: \.self) { word in
                Text(word)
                    .transition(.opacity) // 애니메이션 효과 적용
            }

            // 단어 삭제 섹션
            HStack {
                TextField("삭제할 단어 입력", text: $wordToDelete)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("삭제") {
                    deleteWord()
                }
                .padding(.horizontal)
            }

            // 단어 검색 섹션
            HStack {
                TextField("검색할 단어 입력", text: $searchWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("검색") {
                    searchWordInArray()
                }
                .padding(.horizontal)
            }

            // 상태 메시지 표시
            Text(message)
                .foregroundColor(.red)
                .padding()
        }
        .padding()
        .animation(.easeInOut, value: words) // 단어 목록 변경 시 애니메이션 적용
    }

    // 단어 추가 함수
    func addWord() {
        if newWord.isEmpty {
            message = "단어를 입력하세요."
        } else if words.contains(newWord) {
            message = "이미 존재하는 단어입니다."
        } else {
            words.append(newWord)
            newWord = ""
            message = "단어가 추가되었습니다."
        }
    }

    // 단어 삭제 함수
    func deleteWord() {
        if let index = words.firstIndex(of: wordToDelete) {
            words.remove(at: index)
            wordToDelete = ""
            message = "'\(wordToDelete)'을(를) 삭제했습니다."
        } else {
            message = "해당 단어가 목록에 없습니다."
        }
    }

    // 단어 검색 함수
    func searchWordInArray() {
        if let index = words.firstIndex(of: searchWord) {
            message = "\(searchWord)은 배열의 \(index + 1)번째 위치에 있습니다."
        } else {
            message = "해당 단어가 목록에 없습니다."
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previezws: some View {
//        ContentView()
//    }
//}
#Preview {
    ContentView()
}
//struct ArrayManagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
