//
//  SheetViewController+Delegate.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit
extension SheetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hashtag", for: indexPath) as? HashTagCell else {
            return UICollectionViewCell() }
        cell.text.text = hashTags[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = hashTags[indexPath.row]
        let width = text.widthWithConstrainedHeight(17, font: .boldSystemFont(ofSize: 16))
        
        return CGSize(width: width + 28, height: 30)
    }
    
}


extension SheetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
