//
//  MainViewModel.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight

class MainViewModel {
    let viewController: UIViewController
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func showSheetVC() {
        let sheetVC = SheetViewController()
        sheetVC.configurePanSetting(viewController: sheetVC, defaultHeight: 300, maxHeight: 600)
        viewController.presentPanViewController(viewController: sheetVC)
    }
}
