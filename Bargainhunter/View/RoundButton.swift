//
//  RoundButton.swift
//  Bargainhunter
//
//  Created by Meryem Alay on 21/10/2018.
//  Copyright © 2018 Meryem Alay. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 6
    }

}
