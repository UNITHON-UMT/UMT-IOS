//
//  QuestRegisterViewController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/05.
//

import UIKit

class QuestRegisterViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var questImageView: UIImageView!
    let camera = UIImagePickerController()
}

// MARK: - View Lifecycle
extension QuestRegisterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupAttribute()
        setupLayout()
    }
}

// MARK: - Actions
extension QuestRegisterViewController {
    
    @objc
    func imageViewDidTap(_ sender: UITapGestureRecognizer) {
        present(camera, animated: true, completion: nil)
    }
}

// MARK: - Helpers
extension QuestRegisterViewController {
    
    func setupAttribute() {
        questImageView.isUserInteractionEnabled = true
        let imageTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(imageViewDidTap))
        questImageView.addGestureRecognizer(imageTapGesture)
        
        
        camera.sourceType = .camera
        camera.allowsEditing = true // 정방향 여부
        camera.cameraDevice = .rear // 카메라 방향설정
        camera.cameraCaptureMode = .photo // video, photo 여부
        camera.delegate = self
    }
    
    
    func setupLayout() {
        view.backgroundColor = .red
    }
}

// MARK: - UIImagePickerControllerDelegate & NaviDelegate
extension QuestRegisterViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            questImageView.image = image
        }

        picker.dismiss(animated: true, completion: nil)
    }
}






#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct QuestRegisterViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Quest", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct QuestRegisterViewController_Preview: PreviewProvider {
    static var previews: some View {
        QuestRegisterViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
}
#endif

