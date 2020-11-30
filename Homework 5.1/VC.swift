//
//  VC.swift
//  Homework 5.1
//
//  Created by Stas on 30.11.2020.
//

import UIKit

class VC: UIViewController {

    
    @IBOutlet weak var collectV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectV.dataSource = self
        collectV.delegate = self
        
        collectV.register(UINib(nibName: "CC", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
}
extension VC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! cellCollection
        cell.setNumber(index: indexPath.item)

        return cell
    }
}

extension VC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (view.frame.width - 10) / 2

        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
