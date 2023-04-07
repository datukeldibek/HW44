//
//  CustomCell.swift
//  HW44
//
//  Created by Jarae on 7/4/23.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private var myImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        return iv
    }()
    
    private var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private var mySecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with: Product, and image: UIImage){
        myLabel.text = with.title
        mySecondLabel.text = with.description
    
        myImageView.image = image
        //myImageView.kf.setImage(with: URL(string: with.urlToImage!))

    }
    private func setupUI() {
        
        contentView.addSubview(myImageView)
        myImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(100)
            make.height.equalTo(70)
        }
        
        contentView.addSubview(myLabel)
        myLabel.snp.makeConstraints { make in
            make.right.equalTo(myImageView.snp.left).offset(-30)
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(10)
        }
        
        contentView.addSubview(mySecondLabel)
        mySecondLabel.snp.makeConstraints { make in
            make.right.equalTo(myImageView.snp.left).offset(-30)
            make.top.equalTo(myLabel.snp.bottom).offset(20)
            
            make.left.equalToSuperview().offset(10)
        }
    }

    
}
