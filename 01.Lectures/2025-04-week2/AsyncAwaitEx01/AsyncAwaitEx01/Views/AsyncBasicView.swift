import SwiftUI


struct AsyncBasicEx: View {
    // 텍스트로 출력할 Todo 제목을 상태로 관리
    @State private var todoTitle: String = "Todo List"

    var body: some View {
        VStack(spacing: 20) {
            // 결과 출력용 텍스트
            Text(todoTitle)
                .font(.title2)
                .padding()

            // 버튼: 비동기적으로 Todo 가져오기
            Button("fetch todo") {
                Task {
                    do {
                        // 비동기 API 호출
                        let todo = try await fetchTodo()
                        // 결과 텍스트에 반영
                        todoTitle = "\(todo.title) (완료: \(todo.completed))"
                    } catch {
                        // 에러 발생 시 메시지 출력
                        todoTitle = "에러 발생: \(error.localizedDescription)"
                    }
                }
            }
        }
        .padding()
    }

    // MARK: - Todo API 호출 함수
    /// 비동기적으로 Todo 데이터 가져오기
    /// - Returns: Todo 객체
    func fetchTodo() async throws -> Todo {
        // API URL 생성
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        // URLSession을 이용한 비동기 데이터 요청
        let (data, _) = try await URLSession.shared.data(from: url)
        // 받아온 JSON 데이터를 Todo 구조체로 디코딩
        return try JSONDecoder().decode(Todo.self, from: data)
    }
}

// MARK: - Preview (Xcode Canvas)
#Preview {
    AsyncBasicEx()
}
