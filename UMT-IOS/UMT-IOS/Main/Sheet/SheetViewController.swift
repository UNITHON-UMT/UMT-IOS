//
//  SheetControllerViewController.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight

class SheetViewController: UIViewController {
    
    //MARK: - Properties
    var width: CGFloat {
        return UIScreen.main.bounds.width
    }

    //MARK: - LifeCycles
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentContainerViewWithAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureContainerView()
    }
    
    //MARK: - Helper
    func configureContainerView() {
        // Collection View
        let view = UIView(frame: CGRect(x: 30, y: 30, width: width - 60, height: 30))
        view.backgroundColor = .blue
        
        self.containerView.addSubview(view)
    }
    
}
