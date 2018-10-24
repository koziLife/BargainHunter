//
//  SecondViewController.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 22/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var outboundDateLabel: UILabel!
    @IBOutlet weak var outboundDepartureLabel: UILabel!
    @IBOutlet weak var outboundArrivalLabel: UILabel!
    @IBOutlet weak var inboundDateLabel: UILabel!
    @IBOutlet weak var inboundDepartureLAbel: UILabel!
    @IBOutlet weak var inboundArrivalLabel: UILabel!
    //@IBOutlet weak var secondLabel: UILabel!
    
    var id: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loadText(price: String, outboundDate: String, outboundDeparture: String, outboundArrival: String,
                  inboundDate: String, inboundDeparture: String, inboundArrival: String, bookId:String) {
        priceLabel.text = price
        outboundDateLabel.text = outboundDate
        outboundDepartureLabel.text = outboundDeparture
        outboundArrivalLabel.text = outboundArrival
        inboundDateLabel.text = inboundDate
        inboundDepartureLAbel.text = inboundDeparture
        inboundArrivalLabel.text = inboundArrival
        id = bookId
    }
    
    @IBAction func bookButtonPressed(_ sender: Any) {
//        BookService.instance.callBook(bookId: id){(success) in
//            if success {
//                print(success)
//                print("done")
//                let alert = UIAlertController.init(title: "Book", message: "Your book id is ONFRS", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
//                }))
//                self.present(alert, animated: true)
//
//            }
//        }
        
        let alert = UIAlertController.init(title: "Book", message: "Your book id is ONFRS", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default, handler: { (action : UIAlertAction) in
        }))
        self.present(alert, animated: true)
    }
       
}
