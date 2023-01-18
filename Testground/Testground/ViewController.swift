//
//  ViewController.swift
//  Testground
//
//  Created by Алексей Костюк on 18.01.2023.
//  Copyright © 2023 Алексей Костюк. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
private let networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
      networkManager.getRockets()
    }


}

class NetworkManager {
    func getRockets() {
        URLSession.shared.dataTask(with: Rocket.urlRequest) { data, response, error in
            guard let data else { return }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            let rockets = try? jsonDecoder.decode([Rockets].self, from: data)
            
            print(rockets)
            }
            .resume()
        
    }
}
