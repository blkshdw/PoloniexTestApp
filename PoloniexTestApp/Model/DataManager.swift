//
//  DataManager.swift
//  PoloniexTestApp
//
//  Created by Алексей on 01.12.17.
//  Copyright © 2017 PoloniexTestApp. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import ObjectMapper

class DataManager {
  static let instance = DataManager()
  private init() { }

  private var timerBag: DisposeBag? = DisposeBag()
  private let timer = Observable<Int>.interval(5.0, scheduler: MainScheduler.instance)

  let tickets = Variable<[TicketData]>([])

  static let ticketsURL = URL(string: "https://poloniex.com/public?command=returnTicker")!

  func fetchTickets() -> Observable<[String: Ticket]> {
    return requestJSON(.get, DataManager.ticketsURL).flatMap({ (response, data) -> Observable<[String: Ticket]> in
      return Observable.just(Mapper<Ticket>().mapDictionary(JSONObject: data)!)
    })
  }

  func startUpdatingTickets() {
    timerBag = DisposeBag()

    timer.flatMap { _ -> Observable<[TicketData]> in
      return self.fetchTickets().catchErrorJustReturn([:]).flatMap({ ticketsDict -> Observable<[TicketData]> in
       return Observable.just(ticketsDict.map { TicketData($0.key, $0.value) })
      })
    }.subscribe(onNext: { tickets in
        self.tickets.value = tickets
    }).disposed(by: timerBag!)
  }

  func stopUpdatingTickets() {
    timerBag = nil
  }


}
