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

class TicketBaseView: UIView {
  let nameLabel = UILabel()
  let lastLabel = UILabel()
  let highestBidLabel = UILabel()
  let percentChangeLabel = UILabel()

  let stackView = UIStackView()

  init() {
    super.init(frame: CGRect.null)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  func setup() {
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 2
    stackView.addArrangedSubview(nameLabel)
    stackView.addArrangedSubview(lastLabel)
    stackView.addArrangedSubview(highestBidLabel)
    stackView.addArrangedSubview(percentChangeLabel)

    addSubview(stackView)
    stackView.easy.layout(Edges())
  }

  func configure(_ ticketData: TicketData) {
    nameLabel.text = ticketData.name
    lastLabel.text = ticketData.ticket.last
    highestBidLabel.text = ticketData.ticket.highestBid
    percentChangeLabel.text = ticketData.ticket.percentChange

  }
}
