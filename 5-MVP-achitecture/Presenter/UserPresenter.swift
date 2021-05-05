//
//  UserPresenter.swift
//  5-MVP-achitecture
//
//  Created by Long Nguyễn on 04/05/2021.
//

import UIKit
import Alamofire

// MARK: - Protocol
protocol UserPresenterDelegate {
    func presentUser(user: [User])
} 

typealias PresenterDelegate = UserPresenterDelegate & UIViewController

// MARK: - Class
class UserPresenter {
    var delegate: PresenterDelegate?
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    public func getUsers() {
        let url = "https://fast-bayou-64382.herokuapp.com/users"
        
        AF.request(url, method: .get, encoding: URLEncoding.queryString, headers: nil).responseJSON { (response) in
            
            print(response)
            switch response.result {
            case .success:
                guard let data = response.data else {return}
                
                do {
                    let object = try JSONDecoder().decode([User].self, from: data)
                    self.delegate?.presentUser(user: object)
                    
                } catch {
                    print("Fail to pars object")
                }
            case let .failure(error):
                print("2", error)
            }
        }
    }
}
