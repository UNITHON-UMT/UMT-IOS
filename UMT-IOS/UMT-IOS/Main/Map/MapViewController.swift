//
//  ViewController.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight
import GoogleMaps

class MapViewController: UIViewController, LocDelegate {
    func didSuccessGetLocs(locs: [Loc]) {
        locs.forEach { loc in
            viewModel?.makeMark(latitude: loc.latitude!, longitude: loc.longitude!)
        }
    }
    
    func failedToRequest(_ message: String) {
        
    }
    

    //MARK: - Properties
    var viewModel: MainViewModel?
    var mapView = GMSMapView()
    let sheetVC = SheetViewController()
    let dataManager = DataManager()
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getLocs(lat: 37.548, long: 127.044, delegate: self)
        NotificationCenter.default.addObserver(self, selector: #selector(showSheetVC), name: .init(rawValue: "showSheet"), object: nil)
        viewModel = MainViewModel(viewController: self)
        viewModel?.makeMarkMyLoc(latitude: 37.548, longitude:  127.044)
    }       
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel?.makeMark(latitude: 0, longitude: 0)
    }
    
    @objc func showSheetVC() {
        viewModel?.showSheetVC()
    }
        override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.548, longitude: 127.044, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.delegate = self
    }
}

