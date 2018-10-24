//
//  WishCreateVC.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 21/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import Firebase

class WishCreateVC: UIViewController {
    
    @IBOutlet weak var departure: UISearchBar!
    @IBOutlet weak var arrival: UISearchBar!
    @IBOutlet weak var travelStartDate: UITextField!
    @IBOutlet weak var travelEndDate: UITextField!
    @IBOutlet weak var MinStayDay: UITextField!
    @IBOutlet weak var maxStayDay: UITextField!
    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
    
        let departure = self.departure.text
        let arrival = self.arrival.text
        
        WishService.instance.callCustomerWish(departure: departure!, arrival: arrival!,
                travelStartMonth: travelStartDate.text!, travelEndMonth: travelEndDate.text!,
                minStayDay: MinStayDay.text!, maxStayDay: maxStayDay.text!, price: price.text!
                ){(success) in
            if success {
                print("done")
                let alert = UIAlertController.init(title: "Wish", message: "Your wish has been created", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
                }))
                
                self.present(alert, animated: true)
                
            }
        }
    }
    
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToMainSegue", sender: nil)
    }
}
