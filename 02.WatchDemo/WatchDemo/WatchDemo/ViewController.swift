//
//  ViewController.swift
//  WatchDemo
//
//  Created by 李忠 on 2022/6/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var result: UILabel!;
    var timer: Timer!
    var labelNumber: NSDecimalNumber = NSDecimalNumber(floatLiteral: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }
    private func buildUI() {
        result = UILabel()
        view.addSubview(result)
        result.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(0);
            make.height.equalTo(view).multipliedBy(0.35)
        }
        result.text = "0"
        result.textAlignment = .center
        result.font = UIFont.systemFont(ofSize: 30)
        result.backgroundColor = UIColor(red: 224.0/255.0, green: 203.0/255.0, blue: 182.0/255.0, alpha: 1.0)
        
        let startButton = UIButton(type: .system)
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.top.equalTo(result.snp_bottom)
            make.leading.bottom.equalTo(0)
        }
        startButton.backgroundColor = UIColor(red: 1, green: 101/255.0, blue: 27/255.0, alpha: 1)
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        
        let stopButton = UIButton(type: .system)
        view.addSubview(stopButton)
        stopButton.snp.makeConstraints { make in
            make.top.equalTo(startButton)
            make.leading.equalTo(startButton.snp_trailing)
            make.trailing.bottom.equalTo(0)
            make.width.equalTo(startButton)
        }
        stopButton.backgroundColor = UIColor(red: 98/255.0, green: 242/255.0, blue: 23/255.0, alpha: 1)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.addTarget(self, action: #selector(stopHandler), for: .touchUpInside)
        
        
        let resetButton = UIButton(type: .system)
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(0)
            make.size.equalTo(CGSize(width: 60, height: 20))
        }
        resetButton.setTitle("reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetHandler), for: .touchUpInside)
    }
    
    @objc private func startHandler() {
        if timer != nil {
            stopHandler()
        }
        timer = Timer(timeInterval: 0.1, repeats: true, block: {[weak self] (Timer) in
            self?.labelNumber = self?.labelNumber.adding(NSDecimalNumber(floatLiteral: 0.1)) ?? NSDecimalNumber(floatLiteral: 0)
            self?.result.text = "\(self?.labelNumber ?? NSDecimalNumber(floatLiteral: 0))"
        })
        RunLoop.main.add(timer, forMode: .common)
        timer.fire()
    }
    
    @objc private func stopHandler() {
        guard timer != nil else { return}
        timer.invalidate()
    }
    @objc private func resetHandler() {
        result.text = "0"
        labelNumber = NSDecimalNumber(floatLiteral: 0)
    }
    
}

