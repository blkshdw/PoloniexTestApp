//
//  TicketsTableHeaderView.swift
//  PoloniexTestApp
//
//  Created by Алексей on 02.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class TicketsTableHeaderView: UIView {
  let baseView = TicketBaseView()

  init() {
    super.init(frame: CGRect.null)
    addSubview(baseView)
    baseView.easy.layout(Edges())

    baseView.nameLabel.text = "name"
    baseView.lastLabel.text = "last"
    baseView.highestBidLabel.text = "highestBid"
    baseView.percentChangeLabel.text = "percent"
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
