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
    init(viewController: UIViewController) {
        self.viewController = viewController as! MapViewController
    }
    func showSheetVC() {
        let sheetVC = SheetViewController()
        sheetVC.configurePanSetting(viewController: sheetVC, defaultHeight: 300, maxHeight: 600)
        viewController.presentPanViewController(viewController: sheetVC)
    }
    
    func makeMark() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 33, height: 44))
        imageView.image = UIImage(named: "mark_normal")
        let gmsMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: -33.90, longitude: 151.20))
        gmsMarker.iconView = imageView
        gmsMarker.map = viewController.mapView
    }
}
