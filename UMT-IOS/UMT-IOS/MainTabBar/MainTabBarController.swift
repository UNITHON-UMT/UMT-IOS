//
//  MainTabBarController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/05.
//


import UIKit

class MainTabBarController: UITabBarController {
    // MARK: - Properties
    // 탭바 양 사이드의 CornerRadius
    let customTabBarCornerRadius: CGFloat = 65
    
    // 버튼의 X 위치
    var xPosition = UIScreen.main.bounds.width / 2 - 50
    // 버튼의 X 위치
    var yPosition = UIScreen.main.bounds.height - 100
    // 버튼의 크기
    var buttonWidth = CGFloat(100)
    // 버튼이 올라가는 정도
    var moveUpsideValue = CGFloat(-30)
    
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "createButton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    var customTabBarView = UIView(frame: .zero)
    
    let sheetVC = SheetViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarUI()
        self.addCustomTabBarView()
        self.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupCustomTabBarFrame()
    }
    
    // MARK: - Actions
    // 플러스 버튼을 클릭하면 호출하는 액션메소드
    @objc
    func addButtonDidTap(_ sender: UIButton) {
        moveUpsideAnimation(sender)
    }
    
    func moveUpsideAnimation(_ view: UIView) {
        let moveUpsideValue = self.moveUpsideValue
        UIView.animate(withDuration: 0.33) {
            view.center.y += moveUpsideValue
        } completion: { _ in
            UIView.animate(withDuration: 0.33) {
                view.center.y -= moveUpsideValue
            }
        }
    }
    
    // MARK: - Helpers
    private func setupCustomTabBarFrame() {
        let height = self.view.safeAreaInsets.bottom + 64
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - height
        
        self.tabBar.frame = tabFrame
        self.tabBar.setNeedsLayout()
        self.tabBar.layoutIfNeeded()
        customTabBarView.frame = tabBar.frame
    }
    
    private func setupTabBarUI() {
        // Setup your colors and corner radius
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = customTabBarCornerRadius
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = UIColor.white
        
        // Remove the line
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
        }
    }
    
    private func addCustomTabBarView() {
        self.customTabBarView.frame = tabBar.frame
        
        self.customTabBarView.backgroundColor = .white
        self.customTabBarView.layer.cornerRadius = customTabBarCornerRadius
        self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        self.customTabBarView.layer.masksToBounds = false
        self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.66).cgColor
        self.customTabBarView.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.customTabBarView.layer.shadowOpacity = 0.88
        self.customTabBarView.layer.shadowRadius = 5
        self.view.addSubview(customTabBarView)
        customTabBarView.layer.zPosition = 1
        
        self.view.bringSubviewToFront(self.tabBar)
        self.view.addSubview(addButton)
        addButton.frame = CGRect(
            x: xPosition,
            y: yPosition,
            width: buttonWidth,
            height: buttonWidth)
        
        addButton.layer.cornerRadius = buttonWidth / 2
        addButton.addTarget(
            self,
            action: #selector(addButtonDidTap),
            for: .touchUpInside)
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is VC1 {
            
            sheetVC.configurePanSetting(viewController: sheetVC, defaultHeight: 300, maxHeight: 600)
            presentPanViewController(viewController: sheetVC)
            return false
        }
        return false
    }
}
