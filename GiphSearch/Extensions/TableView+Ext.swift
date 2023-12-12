//
//  TableView+Ext.swift
//  GiphSearch
//
//  Created by Mit Amin on 12/11/23.
//

import Foundation
import UIKit

extension UITableView {
    func setMessageView(title: String, message: String) {
        // initilaze view to show message in a table view
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        // configure labels
        titleLabel.textColor = UIColor.lightGray
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 25)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // add subviews
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        // set constraints
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        
        // set label text
        titleLabel.text = title
        messageLabel.text = message
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func removeMessageView() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
