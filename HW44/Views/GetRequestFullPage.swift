//
//  GetRequestFullPage.swift
//  HW44
//
//  Created by Jarae on 7/4/23.
//

import UIKit
import SnapKit

class GetRequestFullPage: UIViewController {

    var item: Product? = nil
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "fish")
        iv.tintColor = .label
        return iv
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "ERROR"
        return label
    }()
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "ERROR"
        return label
    }()

    public func configure(with: Product, and image: UIImage){
        imageView.image = image
        label.text = with.title
        detailLabel.text = with.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI() {
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(150)
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(50)
            
        }
        view.addSubview(detailLabel)
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(60)
        }
        
    }
    


}
