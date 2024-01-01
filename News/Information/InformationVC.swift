//
//  InformationVC.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import UIKit

class InformationVC: UIViewController {
  
  
  @IBOutlet weak var vwNewsTitle: UIView!
  
  @IBOutlet weak var btnBack: UIButton!
  
  @IBOutlet weak var lblNewsTitle: UILabel!
  @IBOutlet weak var imgNews: UIImageView!
  
  @IBOutlet weak var lblNoImage: UILabel!
  
  @IBOutlet weak var lblAuthor: UILabel!
  @IBOutlet weak var lblDate: UILabel!
  
  @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var vwNewsTitleHeight: NSLayoutConstraint!
    @IBOutlet weak var vwAuthorDateHeight: NSLayoutConstraint!
    
    
    //MARK: - Property InformationView
    var presenter: VTPInformationProtocol?
    var dataNews: [ArticleModel] = []
    var dataAllNews: [AllArticleModel] = []
    var navFrom : navFrom = .TopHeadline
    var indexNumb: Int = 0

    //MARK: - Lifecycle InformationView
    override func viewDidLoad() {
        setUpView()
        setUpAction()
        setUpData()
    }
    
    //MARK: - Function InformationView
    func setUpView(){
        self.navigationItem.setHidesBackButton(true, animated: false)
        switch navFrom{
        case .TopHeadline:
            let firstArticle = dataNews[0]
            if firstArticle.title.count > 50 {
                vwNewsTitleHeight.constant = 80
            } else {
                vwNewsTitleHeight.constant = 60
            }
            
            if firstArticle.author?.count ?? 51 > 50{
                vwAuthorDateHeight.constant = 60
            } else if firstArticle.author?.count ?? 75 > 74 {
                vwAuthorDateHeight.constant = 80
            } else {
                vwAuthorDateHeight.constant = 40
            }
            lblNewsTitle.text = firstArticle.title
            lblAuthor.text = firstArticle.author
            lblDate.text = DateConverter.convertDateString(firstArticle.publishedAt)
            lblDetail.text = firstArticle.content
            if firstArticle.urlToImage == nil {
                imgNews.isHidden = true
                lblNoImage.isHidden = false
                lblNoImage.text = "No Image Preview is Available"
            } else {
                lblNoImage.isHidden = true
                imgNews.kf.setImage(with: URL(string: firstArticle.urlToImage ?? ""))
                print(firstArticle.publishedAt)
            }
            
        case .AllHeadline:
            let firstArticle = dataAllNews[indexNumb]
            if firstArticle.title.count > 50 {
                vwNewsTitleHeight.constant = 80
            } else {
                vwNewsTitleHeight.constant = 60
            }
            
            if firstArticle.author?.count ?? 51 > 50{
                vwAuthorDateHeight.constant = 60
            } else if firstArticle.author?.count ?? 75 > 74 {
                vwAuthorDateHeight.constant = 80
            } else {
                vwAuthorDateHeight.constant = 40
            }
            lblNewsTitle.text = firstArticle.title
            lblAuthor.text = firstArticle.author
            lblDate.text = DateConverter.convertDateString(firstArticle.publishedAt)
            lblDetail.text = firstArticle.content
            if firstArticle.urlToImage == nil {
                imgNews.isHidden = true
                lblNoImage.isHidden = false
                lblNoImage.text = "No Image Preview is Available"
            } else {
                lblNoImage.isHidden = true
                imgNews.kf.setImage(with: URL(string: firstArticle.urlToImage ?? ""))
                print(firstArticle.publishedAt)
            }
        }
    }
    
    func setUpAction(){
        btnBack.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    func setUpData(){
        
    }
    
    @objc func buttonPressed(){
        self.navigationController?.popViewController(animated: true)
    }
    

    //MARK: - Function Action InformationView
    
    
}

    //MARK: - Extension InformationView

extension InformationVC: PTVInformationProtocol {

}
