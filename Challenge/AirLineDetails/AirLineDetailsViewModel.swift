//
//  AirLineDetailsViewModel.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/9/21.
//

import Foundation
class AirLineDetailsViewModel {
    
    private let airLineDetailsService : AirLineDetailsServiceProtocol!
    var selectedAirLine : AirLineModel!
    init(airLineDetailsService: AirLineDetailsServiceProtocol) {
        self.airLineDetailsService = airLineDetailsService
    }
    
    func fetchAirLineDetailsfromNetwork(airLineId: Double, completion: @escaping () -> Void) {
        airLineDetailsService.fetchAirLineDetailsfromNetwork(airLineId: airLineId) { [weak self] (selectedAirLine) in
                self?.selectedAirLine = selectedAirLine
                completion()
        }
    }
    
}
