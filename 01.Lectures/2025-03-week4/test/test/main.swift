////class Test {
////    var date = "2/1"
////    var time = 7
////    
////    func getInfo(){
////        print("\(date) , \(time) ")
////    }
////}
////
////let test1 = Test()
////test.test1.date = "1/2"
////test.test1.time = 2
////test1.getInfo()
////
////var test2 = Test()
////test.test2.date = "2/1"
////test.test2.time = 7
////test2.getInfo()
////
//
//
//
//class music {
//    var title: String = "원본"
//}
//var music1 = music()
//var music2 = music1
//
//music2.title = "수정"
//
//print(music1.title)
//print(music2.title)
//
//
//
//class MusicManager {
//    static let shared = MusicManager()
//    private init() {}
//
//    var currentSong = "없음"
//    func test(){
//        
//    }
//}
class MusicPlayer{
    
}
class Player: MusicPlayer {
    private var title: String = "노래 제목"
    private var volume: Int = 70
    
    func setTitle(newTitle: String) {
            title = newTitle
        }
    func play() {
        print("음악을 재생합니다")
    }

    func stop() {
        print("음악을 멈춥니다")
    }
}

// Player라는 클래스를 상속 받는 IphonePlayer
class IphonePlayer: Player {
    // 같은 play()이지만 다르게 구현함 -> 다형성
    // play()를 재정의하기 때문에 override 붙여야함
    override func play() {
        print("아이폰에서 음악이 재생됩니다")
    }
}

let iphone = IphonePlayer()
iphone.setTitle("노래제목")
iphone.play()
