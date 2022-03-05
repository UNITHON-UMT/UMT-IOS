//
//  ViewController.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
        }
        override func loadView() {
            // Create a GMSCameraPosition that tells the map to display the
            // coordinate -33.86,151.20 at zoom level 6.
            let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
            let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    //        mapView.isMyLocationEnabled = true
            view = mapView
            
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
            marker.title = "Sydney"
            marker.snippet = "Australia"
            marker.map = mapView
        }

    func showSheetVC() {
        let sheetVC = SheetViewController()
        sheetVC.configurePanSetting(viewController: sheetVC, defaultHeight: 300, maxHeight: 600)
        presentPanViewController(viewController: sheetVC)
    }

}

