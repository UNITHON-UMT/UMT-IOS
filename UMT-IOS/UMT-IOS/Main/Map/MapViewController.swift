//
//  ViewController.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight
import GoogleMaps

class MapViewController: UIViewController {

    //MARK: - Properties
    var viewModel: MainViewModel?
    var mapView = GMSMapView()
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
            super.viewDidLoad()
            viewModel = MainViewModel(viewController: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel?.makeMark()
    }
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.delegate = self
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}

