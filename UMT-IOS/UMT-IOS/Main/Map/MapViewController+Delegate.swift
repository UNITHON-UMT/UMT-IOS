//
//  MapViewController+Delegate.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import GoogleMaps

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        self.viewModel?.showSheetVC()
        return true
    }
}
