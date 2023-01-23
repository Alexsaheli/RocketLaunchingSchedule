//
//  Requestable.swift
//  Testground
//
//  Created by Алексей Костюк on 18.01.2023.
//  Copyright © 2023 Алексей Костюк. All rights reserved.
//

import Foundation

protocol Requestable: Decodable {
    static var urlRequest: URLRequest { get }
}
