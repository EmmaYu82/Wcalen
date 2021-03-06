//
//  SetTableView.swift
//  DdayApp
//
//  Created by EMMA on 10/12/2019.
//  Copyright © 2019 EMMA. All rights reserved.
//

import UIKit

class SetTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "setcell"
    
    let set1: [String] = ["나의주기", "주기설정", "알람설정", "비밀번호", "공유하기", "화면설정"]
    let set2: [String] = ["광고없애기", "문의하기", "도움말", "버전정보"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return set1.count
        case 1:
            return set2.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setcell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        let text: String = indexPath.section == 0 ? set1[indexPath.row] : set2[indexPath.row]
        
        setcell.textLabel?.text = text
        return setcell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "개인":"기타"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.performSegue(withIdentifier: "periodlist", sender: nil)
        }
        else if indexPath.section == 0 && indexPath.row == 1 {
            self.performSegue(withIdentifier: "periodcal", sender: nil)
        }
        else if indexPath.section == 0 && indexPath.row == 2 {
            self.performSegue(withIdentifier: "alarmset", sender: nil)
        }
        else if indexPath.section == 0 && indexPath.row == 3 {
            self.performSegue(withIdentifier: "setpin", sender: nil)
        }
        else if indexPath.section == 0 && indexPath.row == 4 {
            self.performSegue(withIdentifier: "setshare", sender: nil)
        }
        else if indexPath.section == 0 && indexPath.row == 5 {
            self.performSegue(withIdentifier: "setbg", sender: nil)
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            self.performSegue(withIdentifier: "deletead", sender: nil)
        }
        else if indexPath.section == 1 && indexPath.row == 1 {
            self.performSegue(withIdentifier: "contact", sender: nil)
        }
        else if indexPath.section == 1 && indexPath.row == 2 {
            self.performSegue(withIdentifier: "appinfo", sender: nil)
        }
        else if indexPath.section == 1 && indexPath.row == 3 {
            self.performSegue(withIdentifier: "versioninfo", sender: nil)
        }
        else {
            self.performSegue(withIdentifier: "rest", sender: nil)
        }
        return

    }
}
