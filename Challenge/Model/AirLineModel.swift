//
//  AirLineModel.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/7/21.
//

import Foundation
struct AirLineModel: Decodable {
    let id: Double?
    let name, country: String?
    let logo: String?
    let slogan, head_quaters, website, established: String?
}
