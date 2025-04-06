//
//  MujiTabBarController.swift
//  MUJIAppTest_1
//
//  Created by Uihyun.Lee on 3/17/25.
//


import UIKit
import MapKit

class MujiTabBarController: UIViewController {

    private let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }

    private func setupMapView() {
        mapView.frame = view.bounds
        mapView.mapType = .standard
        view.addSubview(mapView)
    }
}
