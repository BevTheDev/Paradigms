//
//  DateExamplesViewController.swift
//  Paradigms
//
//  Created by Beverly Massengill on 11/12/19.
//  Copyright © 2019 BevTheDev. All rights reserved.
//

// This class displays the current date in two formats.
// The date is pulled from the current environment, so when running the app,
// the current date will be displayed. But in tests, the date will be
// hard-coded to the date specified in MockEnvironment.swift.

import UIKit

class DateExamplesViewController: UIViewController {

    @IBOutlet weak var friendlyFormatLabel: UILabel!
    @IBOutlet weak var isoFormatLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        isoFormatLabel.text = DateFormatter.iso8601.string(from: Env.date)
        friendlyFormatLabel.text = DateFormatter.monthDayYear.string(from: Env.date)
    }
}
