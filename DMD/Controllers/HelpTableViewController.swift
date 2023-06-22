//
//  HelpTableViewController.swift
//  DMD
//
//  Created by  фф on 17.05.2021.
//

import UIKit

class HelpTableViewController: UITableViewController {
    
    let array = ["Девяткин переулок 6","Кожуховская 2","Пушкинская 19","ЦУМ","Народная 12"]
    var text = ""
    var text1 = ""
    
    //  weak var delegate: PayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
        
    }
    
    override func viewWillLayoutSubviews() {
        preferredContentSize = CGSize(width: 250, height: tableView.contentSize.height)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHelp", for: indexPath)
        let adressData = array[indexPath.row]
        cell.textLabel?.text = adressData
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        text1 = array[indexPath.row]
        //delegate?.update(text: text1)
        self.dismiss(animated: true)
        print(text1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        text = text1
    }
}
