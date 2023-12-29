//
//  HomeInteractor.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//
import UIKit
import Alamofire
import SwiftyJSON


class HomeInteractor: PTIHome {
  var presenter: ITPHome?

  var keyApi = "0d4c8a4ec1fe491eb71a43cf4d420528"
  var isEnd = false
  var get: Int = 0
  var end: Int = 0
  let apiUrl = "https://newsapi.org/v2/top-headlines/sources"
  

      
  func fetchHome() {
    let apiUrl = "https://newsapi.org/v2/top-headlines"
//  https://newsapi.org/v2/top-headlines?country=us&apiKey=0d4c8a4ec1fe491eb71a43cf4d420528
    let parameters: [String: Any] = [
      "country": "us",
      "apiKey": keyApi
    ]
    
    print("//// parameter : \(parameters)")
//    AF.request(apiUrl, method: .get, parameters: parameters)
//      .validate()
//      .responseJSON { response in
//        switch response.result {
//        case .success(let value):
//          let json = JSON(value)
//          let newsSources0 = NewsTopHeadlineUSModel(json: json)
//          print("/////\(newsSources0)")
//          if let sourcesArray = json["sources"].array {
//            // Process each source in the array
//            let newsSources = sourcesArray.map { NewsTopHeadlineUSModel(json: $0) }
//            print("///v/////\(newsSources)")
//            self.presenter?.onSuccessGet(data: newsSources)
//            
//          } else {
//            print("Invalid JSON format")
//          }
//          
//        case .failure(let error):
//          // Handle the failure
//          print("Error: \(error)")
//        }
//      }
    
    AF.request(apiUrl, parameters: parameters).responseDecodable(of: NewsAPIResponse.self) { response in
      switch response.result {
      case .success(let apiResponse):
        let newsEntities = apiResponse.articles.map { NewsEntity(from: $0) }
        print(newsEntities)
        self.presenter?.onSuccessGet(data: newsEntities)
        
      case .failure(let error):
        print("Error")
      }
    }
    
  }
    

}
