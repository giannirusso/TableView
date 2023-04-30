//
//  ViewController.swift
//  tableView
//
//  Created by D K on 29.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self,
                       forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.navigationItem.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.updateLayout(with: self.view.frame.size)
    }
    
    private func updateLayout(with size: CGSize) {
        self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    private func makeImage(_ systemName: String) -> UIImage? {
        guard let defaultImage = UIImage(systemName: "sun.min") else {
            return nil
        }
        
        return UIImage(systemName: systemName) ?? defaultImage
    }
    
    func configure() {
        models.append(Section(title: "General", options: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: makeImage("airplane"),
                                                    iconBackroundColor: .systemRed, handler: {
                                                        print("Switched Airplane Mode")
                                                    }, isOn: true)),
        ]))
        
        models.append(Section(title: "General", options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "house"), iconBackroundColor: .systemPink) {
                print("Tapped Wi-Fi")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth",
                                              icon: UIImage(systemName: "airpods.gen3"),
                                              iconBackroundColor: .link) {
                                                  print("Tapped Bluetooth")
                                              }),
            .staticCell(model: SettingsOption(title: "Airplane Mode",
                                              icon: makeImage("airplane"),
                                              iconBackroundColor: .systemGreen) {
                                                  print("Tapped Airplane Mode")
                                              }),
            .staticCell(model: SettingsOption(title: "iCloud",
                                              icon: UIImage(systemName: "cloud"), iconBackroundColor: .systemOrange) {
                                                  print("Tapped iCloud")
                                              }),
            .staticCell(model: SettingsOption(title: "Mobile Data",
                                              icon: makeImage("antenna.radiowaves.left.and.right"),
                                              iconBackroundColor: .systemBlue) {
                                                  print("Tapped Mobile Data")
                                              })
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "house"), iconBackroundColor: .systemPink) {
                print("Tapped Wi-Fi")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth",
                                              icon: UIImage(systemName: "airpods.gen3"),
                                              iconBackroundColor: .link) {
                                                  print("Tapped Bluetooth")
                                              }),
            .staticCell(model: SettingsOption(title: "Airplane Mode",
                                              icon: makeImage("airplane"),
                                              iconBackroundColor: .systemGreen) {
                                                  print("Tapped Airplane Mode")
                                              }),
            .staticCell(model: SettingsOption(title: "iCloud",
                                              icon: UIImage(systemName: "cloud"), iconBackroundColor: .systemOrange) {
                                                  print("Tapped iCloud")
                                              }),
            .staticCell(model: SettingsOption(title: "Mobile Data",
                                              icon: makeImage("antenna.radiowaves.left.and.right"),
                                              iconBackroundColor: .systemBlue) {
                                                  print("Tapped Mobile Data")
                                              })
        ]))
        
        models.append(Section(title: "Apps", options: [
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "house"), iconBackroundColor: .systemPink) {
                print("Tapped Wi-Fi")
            }),
            .staticCell(model: SettingsOption(title: "Bluetooth",
                                              icon: UIImage(systemName: "airpods.gen3"),
                                              iconBackroundColor: .link) {
                                                  print("Tapped Bluetooth")
                                              }),
            .staticCell(model: SettingsOption(title: "Airplane Mode",
                                              icon: makeImage("airplane"),
                                              iconBackroundColor: .systemGreen) {
                                                  print("Tapped Airplane Mode")
                                              }),
            .staticCell(model: SettingsOption(title: "iCloud",
                                              icon: UIImage(systemName: "cloud"), iconBackroundColor: .systemOrange) {
                                                  print("Tapped iCloud")
                                              }),
            .staticCell(model: SettingsOption(title: "Mobile Data",
                                              icon: makeImage("antenna.radiowaves.left.and.right"),
                                              iconBackroundColor: .systemBlue) {
                                                  print("Tapped Mobile Data")
                                              })
        ]))
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.identifier,
                for: indexPath
            ) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}

class TableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
}
