//
//  CustomViewController.swift
//  Table
//
//  Created by user on 16/11/2020.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Section: \(indexPath.section), row: \(indexPath.row)"
        
        return cell
    }
    
    let headerID = String(describing: CustomHeaderView.self)
    
    private func tableViewConfig() {
        let nib = UINib(nibName: headerID, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
        
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! CustomHeaderView
        
        header.titleLabel!.text = "Section: \(section)"
        
        return header
    }
    
    func tableView(_ tableView: UITableView, hightForHeaderInSectiom section: Int) -> CGFloat{
        return 60
    }

    /*
    // M
     ARK: - Navigation

     

     // In a storyboard-based application, you will often want to do a
     little preparation before navigation
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
