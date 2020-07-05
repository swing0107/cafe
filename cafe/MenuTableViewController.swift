//
//  MenuTableViewController.swift
//  cafe
//
//  Created by SWU mac on 2020/07/05.
//  Copyright © 2020 SWU mac. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var menu:[String: [String]] =
    ["커피 & 에스프레소":["블랙 글레이즈드 라떼","돌체 라떼","화이트 초콜릿 모카","카페 모카","카페 라떼","디카페인 카페 아메리카노","카페 아메리카노","오늘의 커피"],
     "콜드 브루":["콜드 폴 콜드 브루","바닐라 크림 콜드 브루", "콜드 브루"],
     "티바나":["라임 패션 티","자몽 허니 블랙 티","차이 티 라떼","유스베리 티","캐모마일 블랜드 티","민트 블랜드 티","히비스커스 블랜드 티"]]
    var price: [String:[String]] = ["커피 & 에스프레소" : ["6.1","5.6","5.6","5.1","4.6","4.4","4.1","3.8"],
                                    "콜드 브루" : ["5.8","5.5","4.5"],
                                    "티바나":["5.6","5.3","5.1","4.1","4.1","4.1","4.1"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let name = appDelegate.userName {
            self.title = "안녕하세요, " + name + "님"
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menu.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Menu Cell", for: indexPath)

        // Configure the cell...
        var menuName = Array(menu.keys)
        cell.textLabel?.text = menuName[indexPath.row]

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDMView" {
            if let destination = segue.destination as? DetailedTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.title = Array(menu.keys) [selectedIndex]
                    destination.detailedMenu = Array(menu.values) [selectedIndex]
                    destination.drinkprice = Array(price.values) [selectedIndex]
                }
            }
        }
    }


}
