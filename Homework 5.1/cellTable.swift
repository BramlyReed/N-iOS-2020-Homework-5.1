//
//  cellTable.swift
//  Homework 5.1
//
//  Created by Stas on 30.11.2020.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func pushNewScreen()
}

class cellTable: UITableViewCell {
    
    @IBOutlet weak var tableLabel: UILabel!
    
    weak var delegate:MyTableViewCellDelegate?
    
    @IBOutlet weak var buttonName: UIButton!
    func settext(index: Int){
        //print(index)
        tableLabel.text = "Some text \(index)"
    }
    
    @IBAction func pushNewScreen(_ sender: Any) {        
        delegate?.pushNewScreen()
    }
    
}
