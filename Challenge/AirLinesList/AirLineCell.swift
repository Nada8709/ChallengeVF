//
//  AirLineCell.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/8/21.
//

import Foundation
import UIKit
class AirLineCell: UITableViewCell{
    
    @IBAction func airlineDetails(_ sender: UIButton) {
    }
    @IBOutlet weak var airlineName: UILabel!
    
    func configureCell(airline : AirLineModel){
        airlineName.text = airline.name
    }
    
}
