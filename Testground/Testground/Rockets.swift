//
//  Rockets.swift
//  Testground
//
//  Created by Алексей Костюк on 18.01.2023.
//  Copyright © 2023 Алексей Костюк. All rights reserved.
//

import Foundation

struct Rocket: Decodable {
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage
    let thrustVacuum: ThrustVacuum
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int
    let secondStage: SecondStage
    let payloads: Payloads
    let payloadWeights: PayloadWeight
}

extension Rocket {
    struct Height: Decodable {
        let meters: Double
        let feet: Double
    }
    
    struct Diameter: Decodable {
        let meters: Double
        let feet: Double
    }
    
    struct Mass: Decodable {
        let kg: Double
        let lb: Double
        
    }
    struct FirstStage: Decodable {
        let thrustSeaLevel: ThrustSeaLevel
    }
    struct ThrustSeaLevel: Decodable {
        let kN: Int
        let lbf: Int
    }
    
    struct ThrustVacuum: Decodable {
        let kn: Double
        let lb: Double
    }
    
    struct SecondStage: Decodable {
        let thrust: Thrust
        struct Thrust: Decodable {
            let Kn: Double
            let Ibf: Double
        }
    }
    
    struct Payloads: Decodable {
        let compositeFairing: CompositeFairing
        struct CompositeFairing: Decodable {
            let meters: Double
            let feet: Double
        }
    }
    
    struct PayloadWeight: Decodable {
        let id: String
        let name: String
        let kg: Double
        let Ib: Double
    }
    
}

extension Rocket: Requestable {
    static var urlRequest: URLRequest {
        let url = URL(string: "https://api.spacexdata.com/v4/rockets")!
        return URLRequest(url: url)
    }
}
