//
//  ToDoDataModel.swift
//  MVVMTableVIewDemo
//
//  Created by iPhone on 20/10/18.
//  Copyright © 2018 iPhone. All rights reserved.
//

import Foundation
import UIKit

class ToDoViewModel: NSObject {
    var items = [ToDoModel]()
    var reloadSections: (() -> Void)?
    
    override init() {
        super.init()
        GetAllToDos().execute(onSuccess: { (data) in
            self.items = data
            self.reloadSections?()
        }) { (er) in
            print(er)
        }
    }
    
}

extension ToDoViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mvvmdemocell", for: indexPath)
        cell.textLabel?.text = item.title
        return cell
    }
}
