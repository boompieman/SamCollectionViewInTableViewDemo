//
//  TableViewCell.swift
//  SamCollectionViewInTableViewDemo
//
//  Created by MACBOOK on 2018/6/12.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class BigTableViewCell: UITableViewCell {

    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame = newValue

            frame.origin.x = 10

            frame.size.width -= 2 * frame.origin.x
            frame.size.height -= 2 * frame.origin.x

            self.layer.masksToBounds = true
            self.layer.cornerRadius = 8.0

            super.frame = frame
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
