//
//  PlayerViewController.swift
//  SleepApp
//
//  Created by aldybuana on 11/10/22.
//

import UIKit

class PlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
        
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension UIViewController {
    func presentPlayerViewController() {
        let storyboard = UIStoryboard(name: "Player", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "player") as! PlayerViewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .coverVertical
        
        self.present(viewController, animated: true)
    }
    
    func showPlayerViewController() {
        let storyboard = UIStoryboard(name: "Player", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "player") as! PlayerViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
