//
//  ViewController.swift
//  Homework 5.1
//
//  Created by Stas on 30.11.2020.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
        override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomHeader.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.register(UINib(nibName: "TC", bundle: nil), forCellReuseIdentifier: "tableCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! cellTable
        cell.settext(index: indexPath.row)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! cellTable
        let header = tableView.headerView(forSection: indexPath.section) as! CustomHeader
        header.headerLabel.text = cell.tableLabel.text
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                    "sectionHeader") as! CustomHeader
        view.headerLabel.text = "Cell's text"
        return view
    }
    
}

extension ViewController: MyTableViewCellDelegate{
    func pushNewScreen(){
        guard let VC = storyboard?.instantiateViewController(identifier: "pushedController") as? VC else { return }
        present(VC, animated: true)
    }
}
class CustomHeader: UITableViewHeaderFooterView {
    let headerLabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurations() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(headerLabel)

        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
