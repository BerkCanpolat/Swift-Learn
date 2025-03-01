//
//  SettingsTableViewCell.swift
//  ProgrammaticUILearn
//
//  Created by Berk Canpolat on 1.03.2025.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier = "SettingsTableViewCell"
    
    //MARK: - Propertys
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            textLabel?.text = sectionType.description
            switchControl.isHidden = !sectionType.containsSwitch
        }
    }
    
    lazy var switchControl: UISwitch = {
        let sw = UISwitch()
        sw.isOn = true
        sw.onTintColor = .blue
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return sw
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(switchControl)
        
        switchControl.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        
    }
    
    required init?(coder:NSCoder) {
        fatalError()
    }
    
    @objc func handleSwitchAction(sender: UISwitch) {
        if sender.isOn {
            print("Open")
            switchControl.isOn = true
        } else {
            print("Close")
            switchControl.isOn = false
        }
    }

}
