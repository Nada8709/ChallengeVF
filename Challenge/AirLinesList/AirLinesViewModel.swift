//
//  AirLinesViewModel.swift
//  Challenge
//
//  Created by Nada Ashraf on 10/7/21.
//

import Foundation
//protocol AirLinesViewModelProtocol : class {
  //  func fetchairlines(completion: @escaping () -> Void)
//}
class AirLinesViewModel {
    
    var airLinesArray: [AirLineModel] = []
    private var airLines : NetworkServicesProtocol!
    init(airlines: NetworkServicesProtocol) {
        self.airLines = airlines
    }
    func fetchairlines(completion: @escaping () -> Void) {
        airLines.fetchAirLinesfromNetwork {[weak self] (airlinesDict) in
            for key in airlinesDict.keys{
                self?.airLinesArray.append(airlinesDict[key]!)
            }
            completion()
        }
    }
    
    func add(airlinemodel: AirLineModel){
        airLinesArray.insert(airlinemodel, at: 0)
    }
}
