//
//  ARViewContainer.swift
//  ARKitTestEx
//
//  Created by Uihyun.Lee on 4/25/25.
//


import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal] // 수평면 탐지 활성화
        arView.session.run(config)

        // 디버그 정보 표시 (선택 사항)
        arView.debugOptions = [.showFeaturePoints, .showWorldOrigin]

        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}