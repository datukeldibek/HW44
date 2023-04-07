//
//  ViewController.swift
//  HW44
//
//  Created by Jarae on 7/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var  data: [Product] = []
    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .systemBackground
        tableview.allowsSelection = true
        tableview.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableview
    }()
    
    //let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    //let play = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(playTapped))

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    guard let `self` = `self` else {return}
                    self.data = data.products!
                    self.tableView.reloadData()

            }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        //
        
        //navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(onClickMessageButton))
        //navigationItem.rightBarButtonItems = [add]
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style:.plain, target: self, action: #selector(onClickMessageButton))

         
    }


    //MARK: - Setup UI
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        
        //view.backgroundColor = .systemBlue
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.bottom.top.leading.trailing.equalToSuperview()
        }
    }
    @objc func onClickMessageButton() {
        navigationController?.pushViewController(PostRequestPage(), animated: true)
       }
}



extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { fatalError("error") }
        
        let value = data[indexPath.row]
        print(value)
//        let image = images[indexPath.row]
        //cell.configure(with: value, and: UIImage(named: "3")!)
        cell.configure(with: value, and: UIImage(named: "3")!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            200
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestFullPage()
        //vc.item = data[indexPath.row]
        //let image:UIImage = UIImage(named: "3")!
//        vc.configure(with: data[indexPath.row], and: image)
        vc.configure(with: data[indexPath.row], and: UIImage(named: "3")!)
        self.navigationController?.pushViewController(vc, animated: true)
                    
    }
    
    
}
