//
//  PastOrderViewController.swift
//  Bot-Shop
//
//  Created by Rafa Vazquez on 2/27/21.
//
import Foundation
import UIKit

class OrderList: UIViewController {
    
    let tableView =  UITableView()
    var orders: [Order] = []
    
    var orderItems: [Item] = []
    
    var currentOrder: Order!
    
    //    let orders = [Order(title: "July 2020", image: UIImage(named: "box")!),
    //                  Order(title: "June 2020", image: UIImage(named: "box")!),
    //                  Order(title: "May 2020", image: UIImage(named: "box")!),
    //                  Order(title: "December 2019", image: UIImage(named: "box")!),
    //                  Order(title: "November 2019", image: UIImage(named: "box")!),
    //                  Order(title: "October 2019", image: UIImage(named: "box")!),
    //                  Order(title: "September 2019", image: UIImage(named: "box")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.416482389, blue: 0, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(PastOrderCell.self, forCellReuseIdentifier: "cell")
        
        setUpTableView()
    }
    func setUpTableView(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

extension OrderList: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentOrder.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PastOrderCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.setCellContents(item: currentOrder.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
