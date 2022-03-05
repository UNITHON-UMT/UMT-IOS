//
//  String+Extension.swift
//  UMT-IOS
//
//  Created by 이진하 on 2022/03/05.
//

import UIKit

extension String
{
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)

        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return boundingBox.width
    }
}
