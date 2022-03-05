//
//  TreasureViewController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/05.
//

import UIKit

class TreasureViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileBackgroundView: UIView!
    
    @IBOutlet weak var firstTagLabel: UILabel!
    
    @IBOutlet weak var secondTagLabel: UILabel!
    
    @IBOutlet weak var thirdTagLabel: UILabel!
    
    var tagLabels: [UILabel] {
        [firstTagLabel, secondTagLabel, thirdTagLabel]
    }
    
}

// MARK: - View Lifecycle
extension TreasureViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setupLayout()
    }
}

// MARK: - Actions
extension TreasureViewController {
    
}

// MARK: - Helpers
extension TreasureViewController {
    
    private func setupAttribute() {
        profileImageView.layer.cornerRadius
        = profileImageView.frame.size.height/2
        profileBackgroundView.layer.cornerRadius
        = profileBackgroundView.frame.size.height/2
        
        profileImageView.layer.borderWidth = 2
        profileImageView.layer.borderColor = UIColor.white.cgColor
        setupGradient(profileBackgroundView)
        
        profileImageView.clipsToBounds = true
        profileBackgroundView.clipsToBounds = true
        
        tagLabels.forEach {
            $0.layer.borderWidth = 2
            let mainPurple = UIColor(named: "MainPurple")!
            $0.layer.borderColor = mainPurple.cgColor
            $0.layer.cornerRadius = 15
        }
    }
    
    private func setupLayout() {
        
    }
    
    private func setupGradient(_ customView: UIView) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        gradient.zPosition = -1 // <-- 여기 설정 잘하기
        customView.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct TreasureViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Treasure", bundle: nil).instantiateViewController(withIdentifier: "TreasureViewController")
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct TreasureViewController_Preview: PreviewProvider {
    static var previews: some View {
        TreasureViewControllerRepresentable()
    }
}
#endif


class UILabelPadding: UILabel {

    let padding = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.left + padding.right
        let heigth = superContentSize.height + padding.top + padding.bottom
        return CGSize(width: width, height: heigth)
    }
}
