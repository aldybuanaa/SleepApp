//
//  MainViewController.swift
//  SleepApp
//
//  Created by aldybuana on 04/10/22.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup()
    }
    
//    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//
//    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setup()
    }
    
    func setup() {
        
        let isLight = self.traitCollection.userInterfaceStyle == .light
        tabBar.tintColor = isLight ? UIColor(rgb: 0x8E97FD) : UIColor.red
        tabBar.unselectedItemTintColor = isLight ? UIColor(rgb: 0xA0A3B1) : UIColor.white
    }

}
