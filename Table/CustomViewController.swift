//
//  CustomViewController.swift
//  Table
//
//  Created by user on 16/11/2020.
//

import UIKit

class CustomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate {
    
    let headerID = String(describing: CustomHeaderView.self)
    var arrayOfData = [ExpandedModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfData = [
            ExpandedModel(isExpanded: true, title: "Words", array: ["One", "Two", "Three", "Four", "Five"]),
            ExpandedModel(isExpanded: true, title: "Numbers", array: ["6", "7", "8", "9", "10"]),
            ExpandedModel(isExpanded: true, title: "Сharacters", array: ["Q", "W", "E", "R", "T", "Y"]),
            ExpandedModel(isExpanded: true, title: "Emojis", array: ["😀", "😡", "🥶", "😱", "😈"])
        ]
        
        tableViewConfig()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfData.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !arrayOfData[section].isExpanded {
            return 0
        }
        
        return arrayOfData[section].array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayOfData[indexPath.section].array[indexPath.row]
        return cell
    }
    
    
    private func tableViewConfig() {
        let nib = UINib(nibName: headerID, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerID)
        
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! CustomHeaderView
        
        header.configure(title: arrayOfData[section].title, section: section)
        header.rotateImage(arrayOfData[section].isExpanded)
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, hightForHeaderInSectiom section: Int) -> CGFloat{
        return 60
    }
    
    
    func expandedSection(button: UIButton) {
        let section = button.tag

        let isExpanded = arrayOfData[section].isExpanded
        arrayOfData[section].isExpanded = !isExpanded

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
