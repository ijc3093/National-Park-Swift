//
//  ParkDetailTableViewCell.swift
//  NPF_4
//
//  Created by Ike Chukz on 7/19/21.
//  Copyright © 2021 Ikemefuna Chukwunyerenwa. All rights reserved.
//

import UIKit

class ParkDetailTableViewCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parkName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        cellView.addSubview(parkName)
        self.selectionStyle = .none

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        parkName.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        parkName.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
        parkName.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
