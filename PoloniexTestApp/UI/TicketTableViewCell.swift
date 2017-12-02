//
//  TicketTableViewCell.swift
//  PoloniexTestApp
//
//  Created by Алексей on 01.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

class TicketTableViewCell: UITableViewCell {
  let baseView = TicketBaseView()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  func setup() {
    addSubview(baseView)
    baseView.easy.layout(Edges())
  }

  func configure(_ ticketData: TicketData) {
    baseView.configure(ticketData)
  }

}
