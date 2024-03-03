//
//  HomeView.swift
//  APINetworkSecondProject
//
//  Created by Enrico Sousa Gollner on 28/10/23.
//

import UIKit

protocol HomeViewDelegate {
    func getPeople()
}

class HomeView: UIView {
    private var delegate: HomeViewDelegate?
    
    public func delegate(delegate: HomeViewDelegate) {
        self.delegate = delegate
    }
    
    //MARK: - Elements
    lazy var requestButton: UIButton = {
        let reqBt = UIButton()
        reqBt.translatesAutoresizingMaskIntoConstraints = false
        reqBt.setTitle("Request", for: .normal)
        reqBt.setTitleColor(.blue, for: .normal)
        reqBt.backgroundColor = .red
        reqBt.layer.cornerRadius = 10
        reqBt.addTarget(self, action: #selector(fetchRequest), for: .touchUpInside)
        
        return reqBt
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSuperView()
        setupConstraints()
    }
    
    private func addSuperView() {
        backgroundColor = .white
        addSubview(tableView)
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    //MARK: - Functionalities
    @objc func fetchRequest() {
        delegate?.getPeople()
    }
    
}
