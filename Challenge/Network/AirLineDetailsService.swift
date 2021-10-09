//
//  AirLineDetailsService.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/9/21.
//

import Foundation
import Alamofire
protocol AirLineDetailsServiceProtocol{
    func fetchAirLineDetailsfromNetwork(airLineId: Double,completion: @escaping (AirLineModel) -> Void)
}

class AirLineDetailsService : AirLineDetailsServiceProtocol {
    
    func fetchAirLineDetailsfromNetwork(airLineId: Double, completion: @escaping (AirLineModel) -> Void) {
        AF.request(NetworkConstants.AirlineDetailURL+"/"+String(Int(airLineId))).responseDecodable(of: AirLineModel.self) { (response) in
            switch response.result {
                   case .success(let selectedAirLine):
                    completion(selectedAirLine)
                    break
                   case .failure(let error):
                       print(error)
                   }
        }
    }
    
}
