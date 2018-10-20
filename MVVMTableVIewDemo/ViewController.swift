//
//  ViewController.swift
//  MVVMTableVIewDemo
//
//  Created by iPhone on 20/10/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!

    let viewModel = ToDoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = viewModel
        viewModel.reloadSections = { [weak self] () in
            self?.tableView.reloadData()
        
    }


}

}
