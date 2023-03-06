//
//  MyTableViewController.swift
//  TablesAndSwiping
//
//  Created by GDJ on 2023-03-06.
//

import UIKit

class MyTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listData: Array<String> = ["Jays", "Leafs", "Raptors", "Marlies", "FC"]

    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }

    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")

        tableCell.textLabel?.text = listData[indexPath.row]
        tableCell.textLabel!.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        tableCell.accessoryType = .disclosureIndicator

        return tableCell
    }

    //
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let modify = UIContextualAction(style: .normal, title: "Modify") { action, view, success in
            print("Modify button tapped")
            success(true)
        }
        modify.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [modify])
    }
    
    //
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
            print("More button tapped")
        }
        more.backgroundColor = .lightGray
        
        let favourite = UITableViewRowAction(style: .normal, title: "Favourite") { action, index in
            print("Favourite button tapped")
        }
        favourite.backgroundColor = .orange
        
        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            print("Share button tapped")
        }
        share.backgroundColor = .blue
        
        return [share, favourite, more]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
