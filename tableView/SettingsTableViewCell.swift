//
//  SettingsTableViewCell.swift
//  tableViewCellPractice
//
//  Created by D K on 16.04.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: type(of: SettingsTableViewCell.self))
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myLabel)
        
        guard let imageView = self.imageView else { return }
        
        print(imageView.rightAnchor)
        
        NSLayoutConstraint.activate([
            myLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            myLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            myLabel.topAnchor.constraint(equalTo: self.topAnchor),
            myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SettingsOption) {
        imageView?.image = model.icon
        self.myLabel.text = model.title
        self.myLabel.textAlignment = NSTextAlignment.left
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myLabel.text = nil
        self.myLabel.textAlignment = NSTextAlignment.left
    }
}
