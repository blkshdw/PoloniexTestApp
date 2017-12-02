//
//  RootViewController.swift
//  PoloniexTestApp
//
//  Created by Алексей on 01.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UITabBarController {
  let ticketsTableViewController = TicketsTableViewController()
  let emptyViewController = EmptyViewController()
  var ticketsNavigationViewController: UINavigationController!
  var emptyNavigationViewController: UINavigationController!


  override func loadView() {
    super.loadView()
    
    ticketsNavigationViewController = UINavigationController(rootViewController: ticketsTableViewController)
    ticketsNavigationViewController.tabBarItem = UITabBarItem(title: "Tickets", image: nil, tag: 0)

    emptyNavigationViewController = UINavigationController(rootViewController: emptyViewController)
    emptyNavigationViewController.tabBarItem = UITabBarItem(title: "Empty", image: nil, tag: 1)

    setViewControllers([ticketsNavigationViewController, emptyNavigationViewController], animated: false)
  }
}
