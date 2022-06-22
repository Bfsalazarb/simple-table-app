//
//  CustomTableViewCell.swift
//  SimpleTableApp
//
//  Created by Boris on 6/21/22.
//  Copyright © 2022 Boris. All rights reserved.
//

import Foundation
import UIKit
class CustomTableViewCell: UITableViewCell {
    
    var cellImageView = UIImageView()
    var cellTitleLabel = UILabel()
    var cellDetailLabel = UILabel()
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.cellImageView)
        self.addSubview(self.cellTitleLabel)
        self.addSubview(self.cellDetailLabel)
        
        self.setCellImageView()
        self.setCellTitleLabel()
        self.setCellDetailLabel()
        
        
    }
    
    func setCellImageView(){
        self.cellImageView.translatesAutoresizingMaskIntoConstraints = false
        self.cellImageView.clipsToBounds = true
        self.cellImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.cellImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        self.cellImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.cellImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.cellImageView.contentMode = .scaleAspectFill
        
        
    }
    func setCellTitleLabel(){
        self.cellTitleLabel.numberOfLines = 0
        self.cellTitleLabel.adjustsFontSizeToFitWidth = true
        self.cellTitleLabel.sizeToFit()
        
        self.cellTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        self.cellTitleLabel.leadingAnchor.constraint(equalTo: self.cellImageView.trailingAnchor, constant: 20).isActive = true
        self.cellTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.cellTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
    }
    func setCellDetailLabel(){
        self.cellDetailLabel.font = self.cellDetailLabel.font.withSize(10)
        
        self.cellDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cellDetailLabel.leadingAnchor.constraint(equalTo: self.cellImageView.trailingAnchor, constant: 20).isActive = true
        let consHeight = self.cellDetailLabel.heightAnchor.constraint(equalToConstant: 30)
        consHeight.priority = UILayoutPriority.defaultLow
        consHeight.isActive = true
        self.cellDetailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        self.cellDetailLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 0).isActive = true
        let consBottom = self.cellDetailLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        consBottom.priority = UILayoutPriority.defaultHigh
        consBottom.isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
