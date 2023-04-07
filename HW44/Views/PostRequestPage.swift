//
//  PostRequestPage.swift
//  HW44
//
//  Created by Jarae on 7/4/23.
//

import UIKit
import SnapKit
class PostRequestPage: UIViewController {

    private lazy var textField1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "\tID"
        tf.layer.cornerRadius = 12
        tf.layer.backgroundColor = UIColor.white.cgColor
        return tf
    }()
    private lazy var textField2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "\tdescription"
        tf.layer.cornerRadius = 12
        tf.layer.backgroundColor = UIColor.white.cgColor
        return tf
    }()
    private lazy var postRequest: UIButton = {
        let post = UIButton(type: .system)
        post.setTitle("POST", for: .normal)
        post.backgroundColor = .systemRed
        post.setTitleColor(.white, for: .normal)
        post.layer.cornerRadius = 10
        post.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        return post
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI() {
        view.backgroundColor = .gray
        
        view.addSubview(textField1)
        textField1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(500)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
    }
    
    
    @objc private func postRequest(sender: UIButton) {
        APIManager.shared.postRequset(id: Int(textField1.text!)!, title: textField2.text!) { result in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    self.showAlert(with: "success", message: "\(data)")

            }
            case .failure(let error):
                break
            }
        }
    }

    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default))
        present(alert, animated: true)
    }
    

}
