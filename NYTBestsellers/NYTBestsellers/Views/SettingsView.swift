//
//  SettingsView.swift
//  NYTBestsellers
//
//  Created by Jose Alarcon Chacon on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    let name = DataPersistence.getNames()
    
    lazy var settingPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(settingPicker)
        setPickerView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setPickerView() {
        settingPicker.translatesAutoresizingMaskIntoConstraints = false
        settingPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 155).isActive = true
        settingPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        settingPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        settingPicker.heightAnchor.constraint(equalTo: heightAnchor, constant: -500).isActive = true
    }
}
