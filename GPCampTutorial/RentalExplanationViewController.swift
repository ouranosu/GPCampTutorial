//
//  RentalExplanationViewController.swift
//  GPCampTutorial
//
//  Created by work on 2019/11/27.
//  Copyright © 2019 Masahiro Okura. All rights reserved.
//

import UIKit

class RentalExplanationViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var explanationLabel: UITextView!
    
    var image: UIImage!
    var name: String!
    var price: String!
    var explanation: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageView.image = self.image
        nameLabel.text = self.name
        priceLabel.text = self.price
        explanationLabel.text = self.explanation
        self.overrideUserInterfaceStyle = .light
    }
}
