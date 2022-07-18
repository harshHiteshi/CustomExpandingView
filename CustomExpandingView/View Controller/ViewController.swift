//
//  ViewController.swift
//  CustomExpandingView
//
//  Created by Nandini Joshi on 03/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var expandableTableView: UITableView!

    let dataArray: [[String]] = [["Hello","How are you?"],
                                 ["This Is Demo Project"],
                                 ["Hope", "You", "Liked", "The Project"],
                                 ["It Is", "My Project", "Expandable View"]]
    
    var expandModelArray: [ExpandModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.registerTableViewCell()
        for i in 0..<4 {
            let sectionData = ExpandModel.init(titleString: "Section: \(i)", subTitleArray: self.dataArray[i], isExpanded: false)
            self.expandModelArray.append(sectionData)
        }
    }
    
    private func registerTableViewCell() {
        self.expandableTableView.register(ExpandingTableViewCell.nib, forCellReuseIdentifier: ExpandingTableViewCell.identifier)
        self.expandableTableView.register(ExpandableTableViewHeaderCell.nib, forHeaderFooterViewReuseIdentifier: ExpandableTableViewHeaderCell.identifier)
    }

}
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.expandModelArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.expandModelArray[section].subTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandingTableViewCell.identifier) as? ExpandingTableViewCell else { return UITableViewCell() }
        let sectionData = self.expandModelArray[indexPath.section].subTitleArray
        cell.subTitleString = sectionData[indexPath.row]
        return cell
    }
    
}
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let isExpanded: Bool = self.expandModelArray[indexPath.section].isExpanded
        return isExpanded ? UITableView.automaticDimension : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ExpandableTableViewHeaderCell.identifier) as? ExpandableTableViewHeaderCell else { return UIView() }
        headerView.sectionIndex = section
        headerView.headerModel = self.expandModelArray[section]
        headerView.headerBlock = { [self] (index) in
            self.expandModelArray = self.expandModelArray.indices.map { self.expandModelArray[$0].isExpanded = false
                return expandModelArray[$0]
            }
            let isExpanded: Bool = self.expandModelArray[section].isExpanded
            self.expandModelArray[section].isExpanded = isExpanded ? false : true
            self.expandableTableView.reloadData()
        }
        return headerView
    }
    
}
