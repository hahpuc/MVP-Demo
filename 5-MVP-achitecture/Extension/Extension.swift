//
//  Extension.swift
//  5-MVP-achitecture
//
//  Created by Long Nguyễn on 05/05/2021.
//

import UIKit

extension UIViewController {
    func dismissKey() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyBoard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }
}
