//
//  MapViewController.swift
//  CommonUI
//
//  Created by Микаэл Мартиросян on 17.12.2022.
//  Copyright © 2022 CoffeAndCode.org. All rights reserved.
//

import CommonUI
import CoreLocation
import MapKit
import UIKit

class CustomAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}

class CustomItem {
    var item: CustomAnnotation?
    
    init() {
        item = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: 55.759347, longitude: 37.626122), title: "Магазин")
    }
}

class CustomAnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            image = CommonUIAsset.locationArrow.image
        }
    }
}

public class MapViewController: UIViewController {
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    private let mapView = MKMapView()
    private let customItem = CustomItem()
    private let locationArrowButton: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.image = CommonUIAsset.locationArrow.image
        return imageView
    }()
    
    // MARK: - Override functions
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        mapView.delegate = self
        view.addSubview(mapView)
        
        locationArrowButtonConstraints()
        
        guard let item = customItem.item else { return }
        mapView.addAnnotation(item)
        
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        mapView.frame = CGRect(x: 0, y: 30, width: view.bounds.width, height: view.bounds.height - 30)
        locationArrowButton.layer.cornerRadius = locationArrowButton.frame.height / 2
        locationArrowButton.layer.borderColor = UIColor.lightGray.cgColor
        locationArrowButton.layer.borderWidth = 1
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationEnable()
    }
    
    // MARK: - Functions
    
    private func checkAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            showAlertLocation(title: "Вы запретили использование местоположения", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
            break
        default:
            break
        }
    }

    private func checkLocationEnable() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.setupManager()
                self.checkAuthorization()
            } else {
                
                self.showAlertLocation(title: "Нет доступа к геолокации", message: "Разрешить доступ?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
            }
        }
    }

    private func setupManager() {
        locationManager.delegate = self
        // Установка точности определения местоположения
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }
    
    private func showAlertLocation(title: String, message: String?, url: URL?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { alert in
            if let url = url {
                UIApplication.shared.open(url)
            }
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)

        alert.addAction(settingsAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
    
    private func locationArrowButtonConstraints() {
        mapView.addSubview(locationArrowButton)
        locationArrowButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationArrowButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 20),
            locationArrowButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
            locationArrowButton.heightAnchor.constraint(equalToConstant: 45),
            locationArrowButton.widthAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func calculateCenterCoordinate(startPoint: CLLocationCoordinate2D, endPoint: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        let centerLatPoint = (startPoint.latitude + endPoint.latitude) / 2
        let centerLongPoint = (startPoint.longitude + endPoint.longitude) / 2
        let centerPoint = CLLocationCoordinate2D(latitude: centerLatPoint, longitude: centerLongPoint)
        return centerPoint
    }
}

    // MARK: - CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        guard let item = customItem.item?.coordinate else { return }
        
        let center = calculateCenterCoordinate(startPoint: location, endPoint: item)
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1500, longitudinalMeters: 1500)
        mapView.setRegion(region, animated: true)

    }
    
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        print("Can't get your location")
    }
}

    // MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
//    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
////        guard let annotation = annotation as? CustomAnnotation else { return nil }
////
////        var markerView: MKMarkerAnnotationView
////
////        let reuseIdentifier = "MarkerView"
////
////        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? MKMarkerAnnotationView {
////
////            view.annotation = annotation
////            markerView = view
////
////        } else {
////
////            markerView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
////            markerView.canShowCallout = true
////            markerView.calloutOffset = CGPoint(x: 0, y: 0)
////            markerView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
////        }
//
//        guard let annotation = annotation as? CustomAnnotation else { return nil }
//
//        var markerView: CustomAnnotationView
//
//        let reuseIdentifier = "MarkerView"
//
//        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? CustomAnnotationView {
//
//            view.annotation = annotation
//            markerView = view
//
//        } else {
//
//            markerView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
//            markerView.canShowCallout = true
//            markerView.calloutOffset = CGPoint(x: 0, y: 0)
//            markerView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//
//        return markerView
//    }
    
//    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//
//        guard let coordinate = locationManager.location?.coordinate,
//              let item = view.annotation as? CustomAnnotation
//        else { return }
//
//        let startPoint = MKPlacemark(coordinate: coordinate)
//        let endPoint = MKPlacemark(coordinate: item.coordinate)
//
//        let request = MKDirections.Request()
//        request.source = MKMapItem(placemark: startPoint)
//        request.destination = MKMapItem(placemark: endPoint)
//        request.transportType = .walking
//
//        let directions = MKDirections(request: request)
//        directions.calculate { response, error in
//            if let response = response {
//                for route in response.routes {
//                    self.mapView.addOverlay(route.polyline)
//                }
//            } else {
//                print(error?.localizedDescription ?? "No error description")
//            }
//        }
//    }
    
//    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderer = MKPolylineRenderer(overlay: overlay)
//        renderer.strokeColor = .systemBlue
//        renderer.lineWidth = 4
//
//        return renderer
//    }
}
