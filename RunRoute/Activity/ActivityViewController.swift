//
//  ViewController.swift
//  RunRoute
//
//  Created by Admin on 31.08.2020.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class ActivityViewController: UIViewController  {
    
    // MARK: - Properties
    
    private var activityView: ActivityView!
    
    private lazy var coreDataStack = CoreDataStack(modelName: "RunRoute")
    private var locationManager: CLLocationManager!
    private var zoomLevel: Float = 15.0
    private var lastPoint: CLLocationCoordinate2D!
    private var totalDistance = 0.0
    private let path = GMSMutablePath()
    private let currentUser: User
    
    // MARK: - Inits
    
    init(currentUser: User) {
        self.currentUser = currentUser
        super.init(nibName: nil, bundle: nil)
        print("-------------------------------------------")
        print(currentUser)
        print("-------------------------------------------")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func loadView() {
        super.loadView()
        
        activityView = ActivityView()
        
        
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(bigMapViewAction(_:)))
        view.addGestureRecognizer(recognizer)
        
        
        view = activityView
        
        
        
    }
    
    @objc func bigMapViewAction(_ sender: UITapGestureRecognizer? = nil) {
        print("ASDASDAS")
        UIView.animate(withDuration: 25) {
            self.activityView.mapView.anchors(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor)
            
            
        } completion: { _ in
            
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupLocationManager()
        setupViewsAndConstraints()

        lastPoint = CLLocationCoordinate2D(latitude: 48.254830, longitude: 36.738277)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Activity"
    }
    
    // MARK: - Private methods
    
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.delegate = self
    }
    
    private func setupViewsAndConstraints() {
        activityView.startStopButton.addTarget(self, action: #selector(startStopAction), for: .touchUpInside)
    }
    
    @objc private func startStopAction() {
        if activityView.startStopButton.isEnabled {
            locationManager.stopUpdatingLocation()
            UIView.animate(withDuration: 15) {
                self.activityView.mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
                self.activityView.mapView.alpha = 0.3
            }
        } else {
            locationManager.startUpdatingLocation()
            
        }
    }
    
}

extension ActivityViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
//----------------------------------------------------------------------------------------------------------------------------------------------------------
//        db.insert(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//----------------------------------------------------------------------------------------------------------------------------------------------------------
        
        
        path.add(lastPoint)
        path.add(location.coordinate)
        let rectangle = GMSPolyline(path: path)
        rectangle.map = activityView.mapView
        
        let distance = location.distance(from: CLLocation(latitude: lastPoint.latitude, longitude: lastPoint.longitude))
        totalDistance += distance
        print("distance: \(totalDistance)")
        activityView.distanceLabel.text = "\((totalDistance / 1000).rounded(toPlaces: 2)) km"
        lastPoint = location.coordinate
        
        activityView.mapView.animate(to: camera)
     }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            activityView.mapView.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print("Error: \(error)")
    }
    
}

