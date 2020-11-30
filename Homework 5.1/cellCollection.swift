//
//  cellCollection.swift
//  Homework 5.1
//
//  Created by Stas on 30.11.2020.
//

import UIKit

class cellCollection: UICollectionViewCell {
    
    @IBOutlet weak var collectionLabel: UILabel!
    
    func setNumber(index: Int){
        collectionLabel.text = String(index)
    }
    
}
