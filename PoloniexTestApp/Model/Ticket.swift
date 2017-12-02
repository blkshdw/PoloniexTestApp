//
//  Ticket.swift
//  PoloniexTestApp
//
//  Created by Алексей on 01.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import ObjectMapper

class TicketData: Equatable {
  var name: String
  var ticket: Ticket

  init(_ name: String, _ ticket: Ticket) {
    self.name = name
    self.ticket = ticket
  }

  static func ==(lhs: TicketData, rhs: TicketData) -> Bool {
    return lhs.ticket == rhs.ticket
  }
}

class Ticket: Mappable, Equatable {
  var name: String = ""
  var id: Int = 0
  var last: String = ""
  var highestBid: String = ""
  var percentChange: String = ""

  required init?(map: Map) {
    
  }

 func mapping(map: Map) {
  id <- map["id"]
  last <- map["last"]
  name <- map["name"]
  last <- map["last"]
  highestBid <- map["highestBid"]
  percentChange <- map["percentChange"]

  }

  var hashValue: Int {
    return id
  }

  static func ==(lhs: Ticket, rhs: Ticket) -> Bool {
    return lhs.id == lhs.id && rhs.last == rhs.last &&
      rhs.highestBid == lhs.highestBid &&
      rhs.percentChange == lhs.percentChange
  }
}
