//
//  Presenter.swift
//  Snapshots
//
//  Created by Peter K on 07.07.2022.
//

protocol TimerProtocol {
    func getCurrencyRates(country: String) async -> String
}

final class TimerPresenter: TimerProtocol {
    
    weak var view: ViewInput?
    
    // MARK: - Properties
    
    private let networkService = NetworkService()
    private var text = String()
    
    func getCurrencyRates(country: String) async -> String {
        do {
            guard let value = try await networkService.loadRates().rates[country] else {
                return String()
            }
            return "\(value)"
        } catch {
            
        }

        return String()
    }
    
    
}
