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
    
    var fontSize: CGFloat = 16
    var badgeText: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badgeButton.layer.cornerRadius = 8
        badgeButton.badgeColor = .blue
        badgeButton.badgeText = "777"
        badgeButton.badgeTextColor = .white
        
        badgeButton.badgeLabel.font = UIFont.boldSystemFont(ofSize: fontSize)
    }
    
    @IBAction func onTopButtonTap(_ sender: BadgeButton) {
        badgeText += 1
        badgeButton.badgeText = "\(badgeText)"
    }
    
    @IBAction func onButtonTap(_ sender: BadgeButton) {
        fontSize += 8
        badgeButton.badgeTextHorizontalPadding += 2
    }
    
    @IBAction func onBottomButtonTap(_ sender: BadgeButton) {
        badgeText -= 1
        badgeButton.badgeText = "\(badgeText)"
    }
}

