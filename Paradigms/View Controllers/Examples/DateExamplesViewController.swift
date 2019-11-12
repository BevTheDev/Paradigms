//
//  DateExamplesViewController.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

import UIKit

class DateExamplesViewController: UIViewController {

    @IBOutlet weak var friendlyFormatLabel: UILabel!
    @IBOutlet weak var isoFormatLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        isoFormatLabel.text = DateFormatter.iso8601.string(from: Date())
        friendlyFormatLabel.text = DateFormatter.monthDayYear.string(from: Date())
    }
}
