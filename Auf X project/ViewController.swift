//
//  ViewController.swift
//
//  ViewController.swift
//  Auf X Project
//
//  Created by Алексей Костюк on 26.12.2022.
//  Copyright © 2022 Алексей Костюк. All rights reserved.
//

import Foundation
import UIKit

// 1) struct Rocket: Decodable {
//      let height: Double
//      let firstFlight: Date
//    }, struct Launch: Decodable { ... }
// 2) class NetworkManager {
//      fucn getLaunches(result: @escaping (Result<T, Error>) -> Void) {
//          URLSession.shared.dataTask(...)
//      }
//      func getRockets() { }
//    }
// 3) jsonDecoder.keysDecodingStrategy = .convertFromSnakeCase
// 4) ошибка с датой!
// 5) jsonDecoder.dateDecodingStrategy // загуглить Decodable with Custom dates

protocol Requestable: Decodable {
    static var urlRequest: URLRequest { get }
}

// Это плейсхолдер модель





//struct Object: Requestable {
//    static var urlRequest: URLRequest {
//         let url = URL(string: "https://example.com")!
//         let request = URLRequest(url: url)
//         return request
//     }
// }

// extension URLSession {
    
//     static func performRequest<T: Requestable>(on decodable: T.Type, result: @escaping (Result<T, Error>) -> Void) {
//         URLSession.shared.dataTask(with: decodable.urlRequest) { (data, response, error) in
            
//             guard let data = data else { return }
//             do {
//                 let object = try JSONDecoder().decode(decodable, from: data)
//                 print("asdadasdasd")
//                result(.success(object))
//             } catch {
//                 result(.failure(error))
//             }
//
//             }.resume()
//    }
//  }




// Тут пошел реальный код

class NetworkManager {
    
    func getLaunches() {
        
        performRequest<T: Requestable>(on decodable: T.Type, result: @escaping (Result<T, Error>) -> Void) do {
            URLSession.shared.dataTask(with: decodable.urlRequest) { (data, response, error) in
                
                guard let data = data else { return }
                do {
                    let object = try JSONDecoder().decode(decodable, from: data)
                    print("asdadasdasd")
                    result(.success(object))
                } catch {
                    result(.failure(error))
                }
                
                }.resume()
            
        }
        func getRockets() {
            
        }
    }
    // Структура - массив запусков
    
    struct Rocket: Requestable {
        static var urlRequest: URLRequest {
            let url = URL(string: "https://example.com")!
            let request = URLRequest(url: url)
            
            
            //Height
            let height: Height
            struct Height: Codable {
                let meters: Double, feet: Int
            }
            
            //Diameter
            let diameter: Diameter
            struct Diameter: Codable {
                let meters, feet: Double
            }
            
            //Mass
            let mass: Mass
            struct Mass: Codable {
                let kg, lb: Int
            }
            
            //FirstStage
            
            let firstStage: FirstStage
            enum CodingKeys: String, CodingKey {
                case firstStage = "first_stage"
            }
            
            struct FirstStage: Codable {
                let thrustSeaLevel: ThrustSeaLevel
                
                enum CodingKeys: String, CodingKey {
                    case thrustSeaLevel = "thrust_sea_level"
                }
            }
            
            struct ThrustSeaLevel: Codable {
                let kN, lbf: Int
                
            }
            
            //ThrustVacuum
            let thrustVacuum: ThrustVacuum
            enum CodingKeys2: String, CodingKey {
                case thrustVacuum = "thrust_vacuum"
            }
            
            struct ThrustVacuum: Codable {
                let kN, lbf: Int
            }
            //Reusable
            let reusable: Bool
            
            //Engines
            let engines: Int
            
            //FuelAmountTons
            let fuelAmountTons: Double
            enum CodingKeys3: String, CodingKey {
                case fuelAmountTons = "fuel_amount_tons"
            }
            
            //burnTimeSEC
            let burnTimeSEC: Int
            enum CodingKeys4: String, CodingKey {
                case burnTimeSEC = "burn_time_sec"
            }
            
            //SecondStage
            let secondStage: SecondStage
            enum CodingKeys5: String, CodingKey {
                case secondStage = "second_stage"
            }
            
            struct SecondStage: Codable {
                let thrust: Thrust
            }
            
            struct Thrust: Codable {
                let kN, lbf: Int
            }
            
            //Payloads
            let payloads: Payloads
        }
        
        struct Payloads: Codable {
            let compositeFairing: CompositeFairing
            
            enum CodingKeys: String, CodingKey {
                case compositeFairing = "composite_fairing"
            }
        }
        
        struct CompositeFairing: Codable {
            let height, diameter: Diameter
        }
        
        struct Diameter: Codable {
            let meters, feet: Double
        }
        
        //optional_1
        let option1: String
        
        enum CodingKeys: String, CodingKey {
            case option1 = "option_1"
        }
        
        
        //LandingLegs
        let landingLegs: LandingLegs
        enum CodingKeys6: String, CodingKey {
            case landingLegs = "landing_legs"
        }
        
        
        struct LandingLegs: Codable {
            let number: Int
            let material: JSONNull?
        }
        
        class JSONNull: Codable, Hashable {
            
            public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
                return true
            }
            
            public var hashValue: Int {
                return 0
            }
            
            public init() {}
            
            public required init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
                }
            }
            
            public func encode(to encoder: Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encodeNil()
            }
        }
        
        
        //PayloadWeight
        
        let payloadWeights: [PayloadWeight]
        enum CodingKeys: String, CodingKey {
            case payloadWeights = "payload_weights"
        }
        
        struct PayloadWeight: Codable {
            let id, name: String
            let kg, lb: Int
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    return request
}


// Это просто класс запроса загрузки экрана

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        URLSession.performRequest(on: Object.self) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let object):
                print(object)
            }
        }
    }
}


