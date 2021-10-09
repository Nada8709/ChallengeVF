//
//  NetworkServices.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/8/21.
//


import Foundation
import Alamofire
protocol NetworkServicesProtocol : class{
    
    func fetchAirLinesfromNetwork(completion: @escaping (Dictionary<String,AirLineModel>) -> Void)
}

class NetworkServices : NetworkServicesProtocol {
    func fetchAirLinesfromNetwork(completion: @escaping (Dictionary<String,AirLineModel>) -> Void) {
        AF.request(NetworkConstants.AirlinesURL).responseDecodable(of: [AirLineModel].self) { response in
            switch response.result {
                   case .success(let value):
                    var mylines = Dictionary<String,AirLineModel>()
                    for airline in value{
                        if airline.id != nil,  let airlinename = airline.name{
                           mylines[String(airlinename)] = airline
                        }
                    }
                    completion(mylines)
                    break
                   case .failure(let error):
                       print(error)
                   }
        }
    }
    
}
