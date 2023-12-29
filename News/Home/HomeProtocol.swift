//
//  HomeProtocol.swift
//  News
//
//  Created by Ferry jati on 21/12/23.
//

import Foundation
import UIKit

protocol VTPHome: AnyObject {
  var view: PTVHome? {get set}
  var interactor: PTIHome? {get set}
  var router: PTRHome? {get set}
  func startReadMore (nav: UINavigationController)
  func startLoadData()
  func gotoInformation(data: dataNews ,nav: UINavigationController)
}

protocol ITPHome: AnyObject {
  func onSuccessGet(data: [NewsEntity])
  func onFailedLoadData(message: String)
    
}

protocol PTVHome: AnyObject {
  func successGet(data: [NewsEntity])
  func FailedLoadData(message: String)
}

protocol PTIHome: AnyObject {
    var presenter: ITPHome? {get set}
    func fetchHome()
    
    
    
}

protocol PTRHome: AnyObject {
  static func createHomeModule() -> HomeVC
  func pushToInformation(nav: UINavigationController)
  
}
