//
//  DateViewController.swift
//  Snapshots
//
//  Created by Peter K on 07.07.2022.
//

import UIKit

final class DateViewController: UIViewController {
    
    private var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            view.backgroundColor = .lightGray
        default:
            view.backgroundColor = .white
        }
    }
    
    func configureLabel() {
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        label.text = "\(Date.now.formatted(date: .abbreviated, time: .shortened))"
        label.center = view.center
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        view.addSubview(label)
    }
    
}
