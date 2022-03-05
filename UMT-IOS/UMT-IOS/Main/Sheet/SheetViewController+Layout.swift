//
//  SheetViewController+Layout.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//
import UIKit

extension SheetViewController {
    
    func configureContainerView() {
        configureCollectionView()
        treasureInfoLabel()
        questionLayout()
    }
    
    func configureCollectionView() {
        // Collection View
        collectionView.delegate = self
        collectionView.dataSource = self
        self.containerView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(30)
        }
    }
    
    func treasureInfoLabel() {
        containerView.addSubview(pointLabel)
        containerView.addSubview(goodIcon)
        containerView.addSubview(goodLabel)
        containerView.addSubview(badIcon)
        containerView.addSubview(badLabel)
        containerView.addSubview(noticeLabel)
        
        pointLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.leading.equalTo(30)
        }
        
        badLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        badIcon.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.trailing.equalTo(badLabel.snp.leading).offset(-4)
            make.width.equalTo(15)
            make.height.equalTo(18)
        }
        
        goodLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.trailing.equalTo(badIcon.snp.leading).offset(-40)
        }
        
        goodIcon.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.trailing.equalTo(goodLabel.snp.leading).offset(-4)
            make.width.equalTo(15)
            make.height.equalTo(18)
        }
                    
        noticeLabel.snp.makeConstraints { make in
            make.top.equalTo(pointLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(30)
        }
                
        containerView.addSubview(line)
        line.backgroundColor = .systemGray4
        line.snp.makeConstraints { make in
            make.top.equalTo(noticeLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(1)
        }
            
    }
    
    func questionLayout() {
        containerView.addSubview(qIcon)
        containerView.addSubview(questionLabel)
        containerView.addSubview(questionTableView)
        containerView.addSubview(resIcon)
        
        qIcon.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.width.equalTo(25)
            make.width.equalTo(27)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.centerY.equalTo(qIcon.snp.centerY)
            make.leading.equalTo(qIcon.snp.trailing).offset(10)
        }
        
        questionTableView.snp.makeConstraints { make in
            make.top.equalTo(questionLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
            make.height.equalTo(130)
        }
        
        resIcon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(questionTableView.snp.bottom).offset(20)
            make.width.equalTo(142)
            make.height.equalTo(45)
        }
        questionTableView.backgroundColor = .systemGray4
    }
}
