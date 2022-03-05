//
//  SolveViewController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/05.
//

import UIKit

class SolveViewController: UIViewController {
    
    // MARK: - Properties
    
}

// MARK: - View Lifecycle
extension SolveViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: - Actions
extension SolveViewController {
    
}

// MARK: - Helpers
extension SolveViewController {
    
    func setupLayout() {
        
    }
}



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SolveViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Solve", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct SolveViewController_Preview: PreviewProvider {
    static var previews: some View {
        SolveViewControllerRepresentable()
    }
}
#endif

