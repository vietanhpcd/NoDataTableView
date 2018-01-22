//
//  TableViewController.swift
//  NoDataDisplayView
//
//  Created by Anhdzai on 12/26/17.
//  Copyright © 2017 Anhdzai. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var nodataView: UIView!
    
    var array = [0,1,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

       self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(array[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        if array.count == 0 {
            // C1: Hiển thị view nodataView
            tableView.backgroundView = nodataView
            
            // C2: Tạo thông báo UIAlertController
            let alert = UIAlertController(title: "Thong Bao", message: "khong co du lieu", preferredStyle: UIAlertControllerStyle.alert)
            // Thêm nút Đóng cho thông báo
            alert.addAction(UIAlertAction(title: "Dong", style: UIAlertActionStyle.default, handler: nil))
            present(alert, animated: true, completion:  nil)
            
            // C3: Tạo view bằng code
            let noDataIndex: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataIndex.text = "No Data Index"
            noDataIndex.textColor = UIColor.red
            noDataIndex.textAlignment = .center
            tableView.backgroundView = noDataIndex
            tableView.separatorStyle = .none
        }
        return 1
    }
}
