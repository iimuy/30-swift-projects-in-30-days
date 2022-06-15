//
//  ViewController.swift
//  CustomFont
//
//  Created by 李忠 on 2022/6/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "I am the king of the world"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        }
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("Change Font Family", for: .normal)
        changeBtn.addTarget(self, action: #selector(changeFontFamily(btn:)), for: .touchUpInside)
        changeBtn.setTitleColor(.blue, for: .normal)
        view.addSubview(changeBtn)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        changeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        printAllSupportedFontNames()
        
    }

    @objc private func changeFontFamily(btn: UIButton) {
        label.font = btn.isSelected ? UIFont(name: "Savoye LET", size: 30) :
        UIFont.systemFont(ofSize: 30)
        btn.isSelected = !btn.isSelected
    }
    
    private func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
            }
        }
    }

}

