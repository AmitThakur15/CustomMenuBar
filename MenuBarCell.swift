//
//  MenuBarCell.swift
//  CustomMenuBar
//
//  Created by iboss on 19/07/19.
//  Copyright © 2019 iboss. All rights reserved.
//

import UIKit

class MenuBarCell: UICollectionViewCell {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    var imageName: String? {
        didSet {
            thumbnailImageView.image = UIImage(named: imageName!)?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    let thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    func setupView() {
        addSubview(thumbnailImageView)
        
        thumbnailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive  = true
        thumbnailImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        thumbnailImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
