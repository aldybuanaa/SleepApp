//
//  WelcomeViewController.swift
//  SleepApp
//
//  Created by aldybuana on 30/09/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var startedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        startedButton.layer.cornerRadius = 24
        startedButton.layer.masksToBounds = true
    }
    
    @IBAction func StartedButtonTapped(_ sender: Any) {
        
        // Memanggil view controller dari ID main
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
        
        // Replace rootVC nya dari Welcome ke Main
        let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let window = scene.windows.first!
        window.rootViewController = viewController
    }
    
}
