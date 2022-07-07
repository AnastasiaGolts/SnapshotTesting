//
//  ViewController.swift
//  Snapshots
//
//  Created by Peter K on 07.07.2022.
//

import UIKit

protocol ViewInput: AnyObject {
    
}

final class ViewController: UIViewController, ViewInput {
    
    // MARK: - Constants
    
    private enum Constants {
        static let cellIdentifier = "TimerCell"
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
    
    // MARK: - Properties
    
    var output: TimerProtocol?
    
    private var tableView = UITableView()
    var button = UIButton()
    private let array = ["MUR", "EUR", "ALL", "WST", "KPW"]

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureTableView()
        configureButton()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
        default:
            break
        }
    }

}

// MARK: - UI

private extension ViewController {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: Constants.width, height: Constants.height)
        tableView.register(TimerCell.self, forCellReuseIdentifier: Constants.cellIdentifier)

        view.addSubview(tableView)
    }
    
    func configureButton() {
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 70)
        button.center = view.center
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        button.accessibilityIdentifier = "TapButton"
        
        view.addSubview(button)
    }
    
    @objc func buttonDidTap() {
        
        let vc = DateViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
}

// MARK: - Delegate & DataSource

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? TimerCell else {
            return UITableViewCell()
        }

        Task {
            guard let rates = await output?.getCurrencyRates(country: array[indexPath.row]) else {
                return
            }
            cell.configure(currency: rates)
        }

        return cell
    }

}

// MARK: - Set Up

private extension ViewController {
    func setUp() {
        let viewController = self
        let presenter = TimerPresenter()
        
        viewController.output = presenter
        presenter.view = viewController
    }
}

