//
//  InformationWeb.swift
//  News
//
//  Created by Ferry jati on 31/12/23.
//

import UIKit
import WebKit


class InformationWebVC: UIViewController {

  
  @IBOutlet weak var webView: WKWebView!
  //MARK: - Property InformationWebView
  
  
  var presenter: VTPInformationWebProtocol?
  var url: String?

  //MARK: - Lifecycle InformationWebView
  override func viewDidLoad() {
      setUpView()
      setUpData()
  }
  
  //MARK: - Function InformationWebView
  func setUpView(){
      LoadingIndicator.startAnimating()
      webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      if let url = URL(string: url ?? "https://www.google.com") {
          let request = URLRequest(url: url)
          webView.load(request)
      }
      
      LoadingIndicator.stopAnimating()
      
  }
  
  func setUpData(){
      
  }
  

  //MARK: - Function Action InformationWebView
  
  
}

  //MARK: - Extension InformationWebView

extension InformationWebVC: PTVInformationWebProtocol {

}
