//
//  ViewController.swift
//  StarWars
//
//  Created by Nikki Tran on 11/13/23.
//

import UIKit

let lightNotificationKey = "co.nikkitran.lightSide"
let darkNotificationKey = "co.nikkitran.darkSide"

class ViewController: UIViewController {
    
    private let chooseButton = UIButton()
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark = Notification.Name(rawValue: darkNotificationKey)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        chooseButton.tintColor = .blue
        chooseButton.setTitle("Choose a side", for: .normal)
        chooseButton.setTitleColor(.black, for: .normal)
        chooseButton.addTarget(self, action: #selector(didTapChooseButton), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackground(notification:)), name: dark, object: nil)
        
        view.addSubview(chooseButton)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        chooseButton.frame = CGRectMake(20, 150, 150, 30)
        chooseButton.layer.cornerRadius = chooseButton.frame.size.height / 2
        
    }
    
    @objc func didTapChooseButton() {
        DispatchQueue.main.async {
            let controller = SelectionViewController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        }
    }
    
    @objc func updateCharacter(notification: NSNotification) {
        
    }
    
    @objc func updateNameLabel(notification: NSNotification) {
    }
    
    @objc func updateBackground(notification: NSNotification) {
        let isLight = notification.name == light
        let color = isLight ? UIColor.cyan : UIColor.red
        view.backgroundColor = color
    }


}

