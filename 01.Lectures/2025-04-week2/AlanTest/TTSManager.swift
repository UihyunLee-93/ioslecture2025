//
//  TTSManager.swift
//  AlanTest
//
//  Created by Uihyun.Lee on 4/22/25.
//


import AVFoundation

class TTSManager {
    static let shared = TTSManager()
    private let synthesizer = AVSpeechSynthesizer()

    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(utterance)
    }
}