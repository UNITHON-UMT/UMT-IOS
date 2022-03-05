//
//  SheetControllerViewController.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
import PanControllerHeight
import SnapKit

class SheetViewController: UIViewController {
    
    //MARK: - Properties
    var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    var hashTags: [String] = ["#퀘스트존잼", "#포토스팟", "#인생사진"]
    var questions: [String] = []
    var questionSelected: [Bool] = []
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return cv
    }()
    
    let pointLabel: UILabel = {
        let label = UILabel()
        label.text = "+ 50 point"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemGray4
        return label
    }()
    
    let goodIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Good"))
        return imageView
    }()
    
    let goodLabel: UILabel = {
       let label = UILabel()
        label.text = "24"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemGray2
        return label
    }()
    
    let badLabel: UILabel = {
       let label = UILabel()
        label.text = "24"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .systemGray2
        return label
    }()
    
    let badIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Bad"))
        return imageView
    }()
    
    let noticeLabel: UILabel = {
       let label = UILabel()
        label.text = "보물이 도착했습니다!"
        label.font = .boldSystemFont(ofSize: 20)        
        return label
    }()
    
    let line = UIView()
    
    let qIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Qicon"))
        return imageView
    }()
        
    let questionLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "내가 이 장소에서 고백했을때의 멘트는?"
        return label
    }()
    
    let resIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "resIcon"))
        return imageView
    }()

    //MARK: - LifeCycles
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
        presentContainerViewWithAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureContainerView()
        collectionView.register(UINib(nibName: "HashTagCell", bundle: nil), forCellWithReuseIdentifier: "hashtag")
    }
}
