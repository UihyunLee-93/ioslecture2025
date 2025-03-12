//
//  ViewController.swift
//  UIKit_0304_3
//
//  Created by Uihyun.Lee on 3/4/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 위치 관리자 설정
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
            // 초기 지도 위치 설정
            setMapLocation(latitude: 37.5665, longitude: 126.9780, title: "서울", subtitle: "대한민국 수도")
        }

        @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                setMapLocation(latitude: 37.5665, longitude: 126.9780, title: "서울", subtitle: "대한민국 수도")
            case 1:
                setMapLocation(latitude: 35.1796, longitude: 129.0756, title: "부산", subtitle: "바다가 이쁜 도시")
            case 2:
                setMapLocation(latitude: 33.4996, longitude: 126.5312, title: "제주", subtitle: "제주 한라산")
            default:
                break
            }
        }
        
        func setMapLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String, subtitle: String) {
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            myMap.setRegion(region, animated: true)
            
            // 기존 핀 제거 후 새로운 핀 추가
            myMap.removeAnnotations(myMap.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = title
            annotation.subtitle = subtitle
            myMap.addAnnotation(annotation)
            
            // 위치 정보 레이블 업데이트
            lblLocationInfo.text = "현재 위치: \(title)"
            lblLocationInfo2.text = subtitle
        }
    }
