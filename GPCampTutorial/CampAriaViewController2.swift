//
//  CampAriaViewController2.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/26.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit

class CampAriaViewController2: UIViewController {

    @IBOutlet weak var PageController: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        PageController.currentPage = 1
    }
}
