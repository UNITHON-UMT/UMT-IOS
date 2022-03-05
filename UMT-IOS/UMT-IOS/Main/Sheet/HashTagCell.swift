//
//  HashTagCell.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit

class HashTagCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //container view
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor().umtPurple.cgColor
        containerView.layer.cornerRadius = 15
        
        text.textColor = UIColor().umtPurple
    }

}
