//
//  QuestionCell.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit

class QuestionCell: UITableViewCell {
    @IBOutlet weak var radioBtn: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
