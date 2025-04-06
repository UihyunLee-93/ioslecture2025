import UIKit
import MapKit
import CoreLocation

class MapKitViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, AddMarkerDelegate {

    private let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let locationManager = CLLocationManager()
    private var hasUpdatedUserLocation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "감정 지도"

        setupMapView()
        setupLocationManager()
        setupAddButton()
        setupLongPressGesture()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationPermission()
    }

    private func setupMapView() {
        view.addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.isUserInteractionEnabled = true
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }

    private func checkLocationPermission() {
        let status = locationManager.authorizationStatus
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            showLocationPermissionAlert()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }

    private func showLocationPermissionAlert() {
        let alert = UIAlertController(
            title: "위치 권한 필요",
            message: "지도를 사용하려면 위치 권한이 필요합니다.",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "설정으로 이동", style: .default, handler: { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        }))

        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }

        if !hasUpdatedUserLocation {
            hasUpdatedUserLocation = true
            let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
            mapView.setRegion(region, animated: true)
        }
    }

    private func setupAddButton() {
        let addButton = UIButton(type: .system)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        addButton.backgroundColor = UIColor(hex: "#D9B3FF")
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.cornerRadius = 30
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(openAddMarkerModal), for: .touchUpInside)
        
        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    @objc private func openAddMarkerModal() {
        let addMarkerVC = AddMarkerViewController()
        addMarkerVC.delegate = self
        let navController = UINavigationController(rootViewController: addMarkerVC)
        present(navController, animated: true)
    }

    func addMarker(coordinate: CLLocationCoordinate2D, emotion: String, title: String, description: String) {
        let annotation = EmotionAnnotation(coordinate: coordinate, emotion: emotion, title: title, description: description)
        mapView.addAnnotation(annotation)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let emotionAnnotation = annotation as? EmotionAnnotation {
            let identifier = "EmotionMarker"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                let detailButton = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = detailButton
            } else {
                annotationView?.annotation = annotation
            }

            annotationView?.glyphText = emotionAnnotation.emotion
            annotationView?.markerTintColor = .systemBlue
            return annotationView
        }
        return nil
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let emotionAnnotation = view.annotation as? EmotionAnnotation {
            let detailVC = MarkerDetailViewController(emotionAnnotation: emotionAnnotation)
            let navController = UINavigationController(rootViewController: detailVC)
            present(navController, animated: true)
        }
    }

    private func setupLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        mapView.addGestureRecognizer(longPressGesture)
    }

    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let touchPoint = gesture.location(in: mapView)
            let touchCoordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)

            for annotation in mapView.annotations {
                if let emotionAnnotation = annotation as? EmotionAnnotation {
                    let annotationPoint = mapView.convert(emotionAnnotation.coordinate, toPointTo: mapView)
                    let distance = hypot(annotationPoint.x - touchPoint.x, annotationPoint.y - touchPoint.y)

                    if distance < 30 {
                        showDeleteAlert(for: emotionAnnotation)
                        return
                    }
                }
            }
        }
    }

    private func showDeleteAlert(for annotation: EmotionAnnotation) {
        let alert = UIAlertController(title: "마커 삭제", message: "이 마커를 삭제할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
            self.mapView.removeAnnotation(annotation)
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))

        DispatchQueue.main.async { 
            self.present(alert, animated: true)
        }
    }
}
