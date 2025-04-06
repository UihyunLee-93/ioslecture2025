//
//  EmotionAnnotation.swift
//  MapkitTest
//
//  Created by Uihyun.Lee on 3/14/25.
//


import Foundation
import MapKit

class EmotionAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var emotion: String
    var title: String?
    var descriptionText: String

    init(coordinate: CLLocationCoordinate2D, emotion: String, title: String, description: String) {
        self.coordinate = coordinate
        self.emotion = emotion
        self.title = title
        self.descriptionText = description
    }
}
