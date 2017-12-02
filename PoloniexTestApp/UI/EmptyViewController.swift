//
//  EmptyViewController.swift
//  PoloniexTestApp
//
//  Created by Алексей on 01.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class EmptyViewController: UIViewController {
  let titleLabel = UILabel()

  override func viewDidLoad() {
    view.backgroundColor = .white
    view.addSubview(titleLabel)
    titleLabel.easy.layout(Center())
    titleLabel.text = "Updating is paused..."
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    DataManager.instance.stopUpdatingTickets()
  }
}
