//
//  BookService.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 23/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BookService {
    static let instance = BookService()
    let defaults = UserDefaults.standard
    
    func callBook(bookId: String, completion: @escaping CompletionHandler){
        let header = [
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        let book_url =  "http://10.31.42.37:3333/book/matchId=\(bookId)"
        
        print(book_url)
        Alamofire.request(book_url,headers: header).responseString { (response) in
            
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
