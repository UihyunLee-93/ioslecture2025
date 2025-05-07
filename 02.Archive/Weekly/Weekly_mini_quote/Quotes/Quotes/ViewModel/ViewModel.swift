import Foundation

@Observable
@MainActor
class ViewModel {
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(error: Error)
    }
    
    private(set) var status: FetchStatus = .notStarted
    private let fetcher = FetchService()
    
    var quote: Quote
    var charcter: Char
    
    init() {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let quoteData = try! Data(contentsOf: Bundle.main.url(forResource: "samplequote",withExtension: "json")!)
        quote = try! decoder.decode(Quote.self, from: quoteData)
        
        let characterData = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter",withExtension: "json")!)
        charcter = try! decoder.decode(Char.self, from: characterData)
    }
    
    func getData(for show: String) async {
        do {
            quote = try await fetcher.fetchQuote(from: show)
            charcter = try await fetcher.fetchCharacter(quote.character)
            
            charcter.death = try await fetcher.fetchDeath(for: charcter.name)
            
            status = .success
        } catch {
            status = .failed(error: error)
        }
    }
    
    func translateWithAlan(_ text: String, completion: @escaping (String?) -> Void) {
        let prompt = """
        아래 영어 문장을 자연스럽고 완전한 한국어로 번역해줘. 영어로 대답하지 말고, 무조건 한국어 번역만 해줘.
        문장: \(text)
        """
        
        print("Alan에 보낸 번역 요청: \(prompt)")
        
        AlanService.shared.sendCommand(prompt) { result in
            print("Alan 번역 응답: \(result ?? "없음")")
            completion(result)
        }
    }
    
    
    
    
}



