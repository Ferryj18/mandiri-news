//
//  HomeEntity.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NewsResponse {
  let id: String?
  let name: String?
  let description: String?
  let url: String?
  let category: String?
  let language: String?
  let country: String?
  

    init(json: JSON) {
      id = json["id"].stringValue
      name = json["name"].stringValue
      description = json["description"].stringValue
      url = json["url"].stringValue
      category = json["category"].stringValue
      language = json["language"].stringValue
      country = json["country"].stringValue
    }
}
struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]

    struct NewsArticle: Decodable {
        let source: NewsSource
        let author: String?
        let title: String
        let description: String?
        let url: String
        let urlToImage: String?
        let publishedAt: String
        let content: String?
    }

    struct NewsSource: Decodable {
        let id: String?
        let name: String
    }
}

struct NewsEntity {
    let sourceId: String?
    let sourceName: String?
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    init(from article: NewsAPIResponse.NewsArticle) {
        sourceId = article.source.id
        sourceName = article.source.name
        author = article.author
        title = article.title
        description = article.description
        url = article.url
        urlToImage = article.urlToImage
        publishedAt = article.publishedAt
        content = article.content
    }
}



struct NewsTopHeadlineUSModel{
  let sourceId: String
  let sourceName: String
  let author: String
  let title: String
  let description: String
  let url: String
  let urlToImage: String
  let publishedAt: String
  let content: String
  
  init(json: JSON) {
    let source = json["source"]
    sourceId = source["id"].stringValue
    sourceName = source["name"].stringValue
    author = json["author"].stringValue
    title = json["title"].stringValue
    description = json["description"].stringValue
    url = json["url"].stringValue
    urlToImage = json["urlToImage"].stringValue
    publishedAt = json["publishedAt"].stringValue
    content = json["content"].stringValue
  }
}



