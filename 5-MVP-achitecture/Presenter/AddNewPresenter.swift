//
//  AddNewPresenter.swift
//  5-MVP-achitecture
//
//  Created by Long Nguyễn on 05/05/2021.
//

import UIKit
import Alamofire

class AddNewPresenter {
    public func addNewUser(firstName: String, lastName: String ) {
        let url = "https://fast-bayou-64382.herokuapp.com/user_create"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        let parameters = [
            "create_first_name": "\(firstName)",
            "create_last_name": "\(lastName)"
        ]

        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
            .validate()
            .responseJSON { (response) in
            print("Res: ", response)
        }
    }
}
