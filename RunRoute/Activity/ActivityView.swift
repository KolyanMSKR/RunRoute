//
//  ActivityView.swift
//  RunRoute
//
//  Created by Admin on 13.10.2020.
//  Copyright © 2020 Mykola Korotun. All rights reserved.
//

import UIKit
import GoogleMaps

class ActivityView: UIView {
    
    // MARK: - UI's Outlets
    
    let durationLabel = UILabel(title: "00 : 00 : 00",
                                font: .systemFont(ofSize: 60, weight: .bold),
                                numberOfLines: 0,
                                lineBreakMode: .byWordWrapping)
    
    let distanceLabel = UILabel(title: "0\nkm",
                                font: .systemFont(ofSize: 20, weight: .semibold),
                                numberOfLines: 0,
                                lineBreakMode: .byWordWrapping)
    
    let speedLabel = UILabel(title: "0\nkm/h",
                             font: .systemFont(ofSize: 20, weight: .semibold),
                             numberOfLines: 0,
                             lineBreakMode: .byWordWrapping)
    
    let averagePaceLabel = UILabel(title: "00:00\nmin/km",
                                   font: .systemFont(ofSize: 20, weight: .semibold),
                                   numberOfLines: 0,
                                   lineBreakMode: .byWordWrapping)
    
    let startStopButton = UIButton(type: .system,
                                   title: "Start",
                                   titleColor: .white,
                                   font: .systemFont(ofSize: 26, weight: .heavy),
                                   backgroundColor: #colorLiteral(red: 0.1007978449, green: 0.3302669981, blue: 0.3629371762, alpha: 1),
                                   cornerRadius: 20)
    
    var mapView: GMSMapView = {
        var mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let camera = GMSCameraPosition.camera(withLatitude: 48.254830, longitude: 36.738277, zoom: 15.0)
        mapView.isMyLocationEnabled = true
        //mapView.settings.myLocationButton = true
        
        return mapView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .systemBackground
        addSubview(durationLabel)
        addSubview(distanceLabel)
        addSubview(speedLabel)
        addSubview(averagePaceLabel)
        addSubview(mapView)
        addSubview(startStopButton)
        
        NSLayoutConstraint.activate([
            startStopButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startStopButton.bottomAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: -15),
            startStopButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2)
        ])
        
        mapView.anchors(left: self.leftAnchor,
                        bottom: self.safeAreaLayoutGuide.bottomAnchor,
                        right: self.rightAnchor,
                        height: UIScreen.main.bounds.height / 20 * 11)
        
        distanceLabel.anchors(left: self.leftAnchor,
                              bottom: mapView.topAnchor,
                              paddingLeft: 20,
                              paddingBottom: -30,
                              width: UIScreen.main.bounds.width / 4,
                              height: 50)
        
        speedLabel.centerX(in: self)
        speedLabel.anchors(bottom: distanceLabel.bottomAnchor,
                           width: UIScreen.main.bounds.width / 4,
                           height: 50)
        
        averagePaceLabel.anchors(bottom: distanceLabel.bottomAnchor,
                                 right: self.rightAnchor,
                                 paddingRight: -20,
                                 width: UIScreen.main.bounds.width / 4,
                                 height: 50)
        
        durationLabel.centerX(in: self)
        durationLabel.anchors(top: self.topAnchor,
                              bottom: speedLabel.topAnchor,
                              paddingTop: 50,
                              paddingBottom: 30)
    }
    
}






class ActivityView1: UIView {
    
    // MARK: - UI's Outlets
    
    let durationLabel = UILabel(title: "00 : 00 : 00",
                                font: .systemFont(ofSize: 60, weight: .bold),
                                numberOfLines: 0,
                                lineBreakMode: .byWordWrapping)
    
    let distanceLabel = UILabel(title: "0\nkm",
                                font: .systemFont(ofSize: 20, weight: .semibold),
                                numberOfLines: 0,
                                lineBreakMode: .byWordWrapping)
    
    let speedLabel = UILabel(title: "0\nkm/h",
                             font: .systemFont(ofSize: 20, weight: .semibold),
                             numberOfLines: 0,
                             lineBreakMode: .byWordWrapping)
    
    let averagePaceLabel = UILabel(title: "00:00\nmin/km",
                                   font: .systemFont(ofSize: 20, weight: .semibold),
                                   numberOfLines: 0,
                                   lineBreakMode: .byWordWrapping)
    
    let startStopButton = UIButton(type: .system,
                                   title: "Start",
                                   titleColor: .white,
                                   font: .systemFont(ofSize: 26, weight: .heavy),
                                   backgroundColor: #colorLiteral(red: 0.1007978449, green: 0.3302669981, blue: 0.3629371762, alpha: 1),
                                   cornerRadius: 20)
    
    var mapView: GMSMapView = {
        var mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        let camera = GMSCameraPosition.camera(withLatitude: 48.254830, longitude: 36.738277, zoom: 15.0)
        mapView.isMyLocationEnabled = true
        //mapView.settings.myLocationButton = true
        
        return mapView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect){ 
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .systemBackground
        addSubview(durationLabel)
        addSubview(distanceLabel)
        addSubview(speedLabel)
        addSubview(averagePaceLabel)
        addSubview(mapView)
        addSubview(startStopButton)
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        averagePaceLabel.translatesAutoresizingMaskIntoConstraints = false
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startStopButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startStopButton.bottomAnchor.constraint(equalTo: self.mapView.bottomAnchor, constant: -15),
            startStopButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
            
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/2),
            
            distanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            distanceLabel.bottomAnchor.constraint(equalTo: mapView.topAnchor, constant: -30),
            distanceLabel.heightAnchor.constraint(equalToConstant: 50),
            distanceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),
            
            speedLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            speedLabel.bottomAnchor.constraint(equalTo: distanceLabel.bottomAnchor),
            speedLabel.heightAnchor.constraint(equalToConstant: 50),
            speedLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),
            
            averagePaceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            averagePaceLabel.bottomAnchor.constraint(equalTo: distanceLabel.bottomAnchor),
            averagePaceLabel.heightAnchor.constraint(equalToConstant: 50),
            averagePaceLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4),
            
            durationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            durationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            durationLabel.bottomAnchor.constraint(equalTo: speedLabel.topAnchor, constant: 30)
        ])
    }
    
}
