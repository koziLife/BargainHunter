//
//  WishCreateVC.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 21/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit

class WishCreateVC: UIViewController {

    @IBOutlet weak var monthPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        let alert = UIAlertController.init(title: "Wish", message: "Your wish has been created", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
        }))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToMainSegue", sender: nil)
    }
}
