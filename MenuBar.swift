//
//  MenuBar.swift
//  CustomMenuBar
//
//  Created by iboss on 18/07/19.
//  Copyright © 2019 iboss. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    let iconArr = ["home","trending","subscriptions","account"]
    var xPositionforHorizontalBar: NSLayoutConstraint?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = UIColor.red
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: "CellID")
        setupview()
        setupHorizontalBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let horizontalBar : UIView = {
        let hb = UIView()
        hb.backgroundColor = UIColor.white
        hb.translatesAutoresizingMaskIntoConstraints = false
        return hb
    }()
    
    func setupHorizontalBar() {
        addSubview(horizontalBar)
        
        xPositionforHorizontalBar = horizontalBar.leftAnchor.constraint(equalTo: self.leftAnchor)
        xPositionforHorizontalBar?.isActive = true
        
        horizontalBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 2).isActive  = true
    }
    
    func setupview()  {
        backgroundColor = UIColor.red
        addSubview(collectionView)
        
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // set the number of items as per you choice
        return iconArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! MenuBarCell
        cell.imageName = iconArr[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * (frame.width/4)
        xPositionforHorizontalBar?.constant = x
        print(indexPath.item)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
