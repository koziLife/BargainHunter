//
//  WishCreateVC.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 21/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit
import Alamofire

class WishCreateVC: UIViewController {
    @IBOutlet weak var from: UISearchBar!
    @IBOutlet weak var to: UISearchBar!
    @IBOutlet weak var travelStartDate: UITextField!
    @IBOutlet weak var travelEndDate: UITextField!
    @IBOutlet weak var minStayDay: UITextField!
    @IBOutlet weak var maxStayDay: UITextField!
    @IBOutlet weak var price: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createButtonPressed(_ sender: Any) {
        
        let urlString = "https://europe-west1-travix-development.cloudfunctions.net/customerWishlist/?departure_airport=LON&arrival_location=AMS&departure_date=2019-06-29&return_date=2019-07-04&fare_price=40"
        let parameters = [
            "customerId": "customer_1",
            "mobileId": "mobile_1",
            "departure":"FRA",
            "arrival":"BCN",
            "startTravelMonth": 6,
            "endTravelMonth": 7,
            "minStay": 2,
            "maxStay": 7,
            "maxPrice": 50,
            "status": "ACTIVE"
            ] as [String : Any]
       
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                let alert = UIAlertController.init(title: "Wish", message: "Your wish has been created", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
                }))
                
                self.present(alert, animated: true)
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "backToMainSegue", sender: nil)
    }
}
