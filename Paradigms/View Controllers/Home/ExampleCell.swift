//
//  ExampleCell.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import UIKit
import Reusable

class ExampleCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var titleLabel: UILabel!
    
    func setUp(withTitle title: String) {
        
        titleLabel.text = title
        
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.borderWidth = 1
    }
}
