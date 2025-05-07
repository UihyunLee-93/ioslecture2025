///
//  MusicPlayer.swift
//  CarListWithNodejs
//
//  Created by Uihyun.Lee on 4/10/25.
//


// 추상화 : 공통 규칙만 정의하고 실질적인 구현은 없는 프로토콜 선언
protocol MusicPlayer {
    var title: String { get }
    var volume: Int { get set }

    func play()
    func stop()
}

// Player라는 클래스가 MusicPlayer를 채택하여 추상화한 규칙을 실질적으로 구현함
class Player: MusicPlayer {
    var title: String = "노래 제목"
    var volume: Int = 70

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

class IpadPlayer: Player {
    override func play() {
        print("아이패드에서 음악이 재생됩니다")
    }
}

// 다형성은 하나의 공통된 틀 안에서 서로 다른 여러개가 반복되어서 보여지는거라서 배열에 넣어야함
// 배열이 없으면 다형성이 사라짐
let players: [MusicPlayer] = [IphonePlayer(), IpadPlayer()]
for player in players {
    player.play()
}
