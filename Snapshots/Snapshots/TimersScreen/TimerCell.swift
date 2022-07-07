//
//  TimerCell.swift
//  Snapshots
//
//  Created by Peter K on 07.07.2022.
//

import UIKit

final class TimerCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let timerLabel = UILabel()
    private let startButton = UIButton()
    private let stopButton = UIButton()
    
    private var seconds = 0
    private var timer: Timer?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        createUI()
    }
    
    func configure(currency: String) {
        titleLabel.text = currency
    }
    
}

// MARK: - UI

private extension TimerCell {
    func createUI() {
        createStopButton()
        createStartButton()
        createTitleLabel()
        createTimerLabel()
    }
    
    func createTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    
    func createTimerLabel() {
        addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    
    func createStopButton() {
        stopButton.frame = CGRect(x: UIScreen.main.bounds.width - 80, y: 6, width: 40, height: 40)
        stopButton.setImage(UIImage(systemName: "stop"), for: .normal)
        stopButton.setImage(UIImage(systemName: "stop.fill"), for: .highlighted)
        stopButton.addTarget(self, action: #selector(pressStopButton), for: .touchUpInside)
        contentView.addSubview(stopButton)
    }
    
    func createStartButton() {
        startButton.frame = CGRect(x: UIScreen.main.bounds.width - 130, y: 6, width: 40, height: 40)
        startButton.setImage(UIImage(systemName: "play"), for: .normal)
        startButton.setImage(UIImage(systemName: "play.fill"), for: .highlighted)
        startButton.addTarget(self, action: #selector(pressStartButton), for: .touchUpInside)
        contentView.addSubview(startButton)
    }
    
}

// MARK: - Actions

private extension TimerCell {
    @objc func pressStartButton() {
        startTimer()
    }
    
    @objc func pressStopButton() {
        stopTimer()
    }
    
    func startTimer() {
        startButton.isEnabled = false
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        if timer != nil {
            RunLoop.main.add(timer ?? Timer(), forMode: .common)
        }
    }
    
    @objc func updateTimer() {
        seconds += 1
        timerLabel.text = "\(seconds)"
    }
    
    func stopTimer() {
        guard let timer = timer else {
            return
        }
        startButton.isEnabled = true
        seconds = 0
        timerLabel.text = ""
        timer.invalidate()
    }
    
}
