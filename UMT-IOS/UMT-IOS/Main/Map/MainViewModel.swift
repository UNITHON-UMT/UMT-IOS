//
//  MainViewModel.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight
import GoogleMaps

class MainViewModel {
    let viewController: MapViewController
    var markers: [GMSMarker] = []
    init(viewController: UIViewController) {
        self.viewController = viewController as! MapViewController
    }
    
    @objc func showSheetVC() {
        let sheetVC = viewController.sheetVC
        sheetVC.configurePanSetting(viewController: sheetVC, defaultHeight: 300, maxHeight: 600)        
        viewController.presentPanViewController(viewController: sheetVC)
    }
    
    func makeMark(latitude: Double, longitude: Double) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 33, height: 44))
        imageView.image = UIImage(named: "mark_normal")
        let gmsMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        gmsMarker.iconView = imageView
        gmsMarker.map = viewController.mapView
        markers.append( gmsMarker)
        print("markers: \(markers)")
        viewController.mapView.layoutIfNeeded()
    }
    func makeMarkMyLoc(latitude: Double, longitude: Double) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 33, height: 44))
        imageView.image = UIImage(named: "myLocation")
        let gmsMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        gmsMarker.iconView = imageView
        gmsMarker.map = viewController.mapView
        markers.append( gmsMarker)
        print("markers: \(markers)")
        viewController.mapView.layoutIfNeeded()
    }
}
