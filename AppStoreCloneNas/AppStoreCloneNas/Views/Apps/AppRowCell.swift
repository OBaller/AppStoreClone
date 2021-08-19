//
//  AppRowCell.swift
//  AppStoreCloneNas
//
//  Created by Decagon on 14/08/2021.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let appIcon = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .boldSystemFont(ofSize: 13))
    let getButton =  UIButton(title: "GET")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //appIcon.backgroundColor = .purple
        appIcon.constrainWidth(constant: 64)
        appIcon.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 16
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [appIcon, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
