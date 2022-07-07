//
//  NetworkService.swift
//  Snapshots
//
//  Created by Peter K on 07.07.2022.
//

import UIKit

enum NetworkError: Error {
    case somethingWrong
}

protocol NetworkServiceProtocol: AnyObject {
    func loadRates() async throws -> Currency
}

final class NetworkService: NetworkServiceProtocol {
    
    private enum Endpoint {
        static let currencyEndpoint = "https://api.exchangerate.host/latest?base=USD&amount=1"
    }
    
    func loadRates() async throws -> Currency {
        let (data, _) = try await URLSession.shared.data(from: URL(string: Endpoint.currencyEndpoint)!)
        let currencyRates = try JSONDecoder().decode(Currency.self, from: data)
        return currencyRates
    }
}
