//
//  TicketsTableViewController.swift
//  PoloniexTestApp
//
//  Created by Алексей on 01.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import EasyPeasy

private let reuseIdentifier = "TicketTableViewCell"

class TicketsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  private let tableView = UITableView()
  private let disposeBag = DisposeBag()
  let headerView = TicketsTableHeaderView()

  var tableViewDataSource: [TicketData] = [] {
    didSet {
      guard tableViewDataSource != oldValue else { return }
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    DataManager.instance.tickets.asObservable().subscribe(onNext: { tickets in
      self.tableViewDataSource = tickets
    }).disposed(by: disposeBag)

    view.backgroundColor = .white

    view.addSubview(headerView)
    headerView.easy.layout(
      Top().to(topLayoutGuide),
      Height(40),
      Left(),
      Right()
    )

    view.addSubview(tableView)
    tableView.easy.layout(
      Top().to(headerView),
      Left(),
      Right(),
      Bottom().to(bottomLayoutGuide)
    )

    tableView.dataSource = self
    tableView.delegate = self

    tableView.register(TicketTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    DataManager.instance.startUpdatingTickets()
  }


 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TicketTableViewCell
    cell.configure(tableViewDataSource[indexPath.row])
    return cell
  }

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableViewDataSource.count
  }

 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
}
