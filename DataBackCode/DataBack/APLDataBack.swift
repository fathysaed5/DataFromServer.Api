//
//  APLDataBack.swift
//  DataBackCode
//
//  Created by fathy  on 7/28/19.
//  Copyright © 2019 fathy . All rights reserved.
//

import Foundation
import Alamofire

class APLDataBack {
    static let shared = APLDataBack()
    func regesterData(url:String , name:String , password:String , email:String , phone:String ,  comletion: @escaping (DataBackRe? , Error?)->()) {
        
        let parmeters = ["lang":"" , "fire_base_token":"sdasda" , "mobile":phone , "email":email , "password" :password , "name":name]
        let headers = ["Content-Type":"application/json"]
        
        Alamofire.request(url, method: .post, parameters: parmeters, encoding: JSONEncoding.default, headers: headers).responseJSON { (respens) in
            guard let data = respens.data else {return}
            switch respens.result{
            case.success(let value):
                do
                { let Datarespne = try JSONDecoder().decode(DataBackRe.self, from: data)
                    comletion(Datarespne, nil )
                }catch let JsonError {
                print(JsonError)
                }
            case.failure(let error):
                comletion( nil , error)
            }
        }
    }
    
    func login(url:String, name:String ,password:String , complection:@escaping (DataBackRe? , Error?)->()) {
        let parmeterss = ["password":password , "email":name, "lang": ""]
        let headerss = ["Content-Type":"application/json"]
        Alamofire.request(url, method: .post, parameters: parmeterss, encoding: JSONEncoding.default, headers: headerss).responseJSON { (respons) in
            guard  let data = respons.data else {return}
            switch respons.result{
            case.success(let value):
                do{
                    let login = try JSONDecoder().decode(DataBackRe.self, from: data)
                    complection(login, nil)
                }catch let fathyError {
                    
                print(fathyError)
                }
            case.failure(let Error):
                complection(nil, Error)
            }
        }
    }
}
