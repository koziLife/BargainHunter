//
//  ViewController.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 21/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var labelText : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadLabel(text: String) {
        labelText = text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = sender as? SecondViewController {
            vc.loadText(text: labelText)
        }
        
//        performSegue(withIdentifier: "To_Second", sender: nil)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

