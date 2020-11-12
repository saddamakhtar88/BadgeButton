//
//  ViewController.swift
//  BadgeButtonSample
//
//  Created by Saddam Akhtar on 10/31/20.
//

import UIKit
import BadgeButton

class ViewController: UIViewController {

    @IBOutlet weak var badgeButton: BadgeButton!
    
    var fontSize: CGFloat = 18
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badgeButton.layer.cornerRadius = 8
        badgeButton.badgeColor = .blue
        badgeButton.badgeText = "1"
        badgeButton.badgeTextColor = .white
        
        badgeButton.badgeLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    @IBAction func onButtonTap(_ sender: BadgeButton) {
        fontSize += 8
        sender.badgeLabel.font = badgeButton.badgeLabel.font.withSize(fontSize)
    }
}

