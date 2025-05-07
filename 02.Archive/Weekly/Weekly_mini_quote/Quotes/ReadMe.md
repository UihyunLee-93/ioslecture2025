# 명대사 번역 앱 (Breaking Bad & Better Call Saul Quotes)

이 앱은 Breaking Bad와 Better Call Saul의 캐릭터 명대사를 랜덤으로 불러오고, Alan API를 통해 자연스럽게 한국어로 번역해주는 SwiftUI 기반 iOS 앱입니다.

## 주요 기능

- 랜덤 명대사 불러오기: 각 시리즈의 명대사를 API를 통해 랜덤으로 가져옵니다.
- AI 번역 기능: Alan API를 활용해 영어 명대사를 자연스러운 한국어로 번역합니다.
- 캐릭터 상세 보기: 명대사의 캐릭터를 클릭하면 인물 정보, 직업, 별명, 사망 여부(스포일러 주의) 등을 보여줍니다.
- 이미지 로딩: 캐릭터 이미지 및 사망 이미지(있는 경우)를 로딩하여 시각적으로 제공합니다.

## 사용 기술

- SwiftUI: UI 구성
- Async/Await: 비동기 데이터 로딩
- Alan API: 자연어 번역 처리
- Custom API: Breaking Bad 관련 명대사/캐릭터 정보 제공 API 사용

## 프로젝트 구조

- `QuoteView.swift` — 명대사 뷰
- `CharacterView.swift` — 인물 상세 정보 뷰
- `FetchService.swift` — 명대사, 캐릭터, 사망 정보 fetch
- `AlanService.swift` — Alan API 연동
- `ViewModel.swift` — 데이터 상태 관리
