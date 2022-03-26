//
//  ViewControllerExt.swift
//  revision1
//
//  Created by Jakub Stepien on 26/03/2022.
//

import UIKit

extension UIViewController {
    func setupNavBar(topViewLabel: inout UILabel) {
        topViewLabel = UILabel()

        topViewLabel.text = "Readator"
        topViewLabel.translatesAutoresizingMaskIntoConstraints = false
        topViewLabel.textAlignment = .center


        view.addSubview(topViewLabel)
        
//        view.addSubview(topView)
        
        NSLayoutConstraint.activate([
            topViewLabel.topAnchor.constraint(equalTo:
                                            view.layoutMarginsGuide.topAnchor),
            topViewLabel.centerXAnchor.constraint(equalTo:
                                            view.layoutMarginsGuide.centerXAnchor)

        ])
//        self.navigationItem.title =  "Readator"
//        self.navigationController?.navigationBar.barTintColor = .white
//        self.navigationController?.navigationBar.backgroundColor = .blue
    }
}



