//
//  WishService.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 23/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WishService {
static let instance = WishService()
let defaults = UserDefaults.standard

    func callCustomerWish(departure: String, arrival: String, travelStartMonth: String, travelEndMonth: String,
                          minStayDay: String, maxStayDay: String, price: String,
                          completion: @escaping CompletionHandler){
        let dictMonths : [String:String] = ["January": "1", "February": "2", "March":"3", "April":"4",
                                            "May":"5", "June": "6", "July":"7", "August":"8", "September":"9",
                                            "October": "10", "November":"11", "December":"12"]
        

    let header = [
        "Content-Type": "application/json; charset=utf-8"
    ]
    
       let url =  "https://europe-west1-travix-development.cloudfunctions.net/customerWishlist/create?customerId=customer_1&mobileId=mobile_1&departure=\(departure.uppercased())&arrival=\(arrival.uppercased())&startTravelMonth=\(travelStartMonth)&endTravelMonth=\(travelEndMonth)&minStay=\(minStayDay)&maxStay=\(maxStayDay)&maxPrice=\(price)&status=ACTIVE"
        print(url)
    Alamofire.request(url,headers: header).responseString { (response) in
        
        if response.result.error == nil {
            print(response)
            completion(true)
        } else {
            completion(false)
            debugPrint(response.result.error as Any)
        }
    }

    }
}
