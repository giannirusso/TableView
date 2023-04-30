//
//  DetailViewController.swift
//  tableView
//
//  Created by D K on 16.04.2023.
//


import UIKit


final class DetailViewController: UIViewController {
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
}
