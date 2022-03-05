//
//  CameraViewController.swift
//  UMT-IOS
//
//  Created by 김우성 on 2022/03/06.
//

import UIKit
import AVFoundation
import SnapKit

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let photo_btn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints  = false
        btn.backgroundColor = .clear
        btn.setImage(UIImage(named: "camera"), for: .normal)
        btn.addTarget(self, action: #selector(didTakePhoto), for: .touchUpInside)
        return btn
    }()
    
    let photo_imageview : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .brown
        return iv
    }()
    
    var backButton = UIButton(type: .system)

    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
//    let imageName = #imageLiteral(resourceName: "moya")
    
    //let imageviewheight : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        setuplayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = .white
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                print("Unable to access back camera!")
                return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            //Step 9
            stillImageOutput = AVCapturePhotoOutput()
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setupLivePreview()
            }
        }
        catch let error  {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            //Step 13
            DispatchQueue.main.async {
                // 여기서 view1 은 내가 카메라가 나올 uiView
                self.videoPreviewLayer.frame = self.view1.bounds
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
    @objc func didTakePhoto() {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
    
    @objc
    func backbuttonDidTap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupAttribute() {
        backButton.setImage(
            UIImage(named: "backIcon"),
            for: .normal)
    }
    
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        
        // MARK: - Result Image
        let image = UIImage(data: imageData)
        //여기서 photo_imageview 은 사진촬영후 나오는 이미지 뷰
//        photo_imageview.image = image
        
        let storyboard = UIStoryboard(name: "Quest", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddTreasureViewController") as! AddTreasureViewController
        viewController.takenPhoto = image
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true)
    }
    
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        // 여기서 view1 은 내가 카메라가 나올 uiView
        view1.layer.addSublayer(videoPreviewLayer)
    }

    func setuplayout() {
        view.addSubview(view1)
        view1LayoutManager()
        view.addSubview(photo_btn)
        photoButtonManager()
        view.addSubview(photo_imageview)
        photoImageViewManager()
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview()
                .offset(63)
            $0.left.equalToSuperview()
                .offset(30)
        }
    }
    
    func view1LayoutManager() {
        view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        view1.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        view1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        view1.heightAnchor.constraint(equalToConstant: view.frame.height * 0.8).isActive = true
    }
    
    func photoButtonManager() {
        photo_btn.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    func photoImageViewManager() {
        photo_imageview.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 10).isActive = true
        photo_imageview.leadingAnchor.constraint(equalTo: photo_btn.trailingAnchor, constant: 10).isActive = true
        photo_imageview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        photo_imageview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
}
