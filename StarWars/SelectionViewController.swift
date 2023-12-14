//
//  SelectionViewController.swift
//  StarWars
//
//  Created by Nikki Tran on 11/13/23.
//

import UIKit

class SelectionViewController: UIViewController {
    
    private let darkImageView = UIImageView()
    private let lightImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        darkImageView.image = UIImage(named: "dark")
        darkImageView.contentMode = .scaleAspectFill
        darkImageView.clipsToBounds = true
        
        let darkTap = UITapGestureRecognizer(target: self, action: #selector(didTapDark))
        darkImageView.addGestureRecognizer(darkTap)
        darkImageView.isUserInteractionEnabled = true
        
        lightImageView.image = UIImage(named: "light")
        lightImageView.contentMode = .scaleAspectFill
        lightImageView.clipsToBounds = true
        
        let lightTap = UITapGestureRecognizer(target: self, action: #selector(didTapLight))
        lightImageView.addGestureRecognizer(lightTap)
        lightImageView.isUserInteractionEnabled = true
        
        view.addSubview(darkImageView)
        view.addSubview(lightImageView)
    }
    
    override func viewDidLayoutSubviews() {
        darkImageView.frame = CGRectMake(50, 100, 50, 50)
        darkImageView.layer.cornerRadius = 50/2
        
        lightImageView.frame = CGRectMake(50, CGRectGetMaxY(darkImageView.frame), 50, 50)
        lightImageView.layer.cornerRadius = 50/2
    }
    
    @objc func didTapDark() {
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true)
    }
    
    @objc func didTapLight() {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true)
    }

}
