//
//  ApiManager.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

enum MockEndPoint:String {
    case schoolList = "s3k6-pzi2.json"
    case schoolDetail = "f9bf-2cp4.json"
}

class ApiMockManager {
    
    static let shared = ApiMockManager()
    
    func fetchDataFromDisk<T:Decodable>(model:T.Type, api:MockEndPoint, successCallback: (@escaping (_ model:T?) -> Void) , failureCallback: (@escaping (_ error:Error?) -> Void))  {
        
        
        if let file = Bundle.main.url(forResource: api.rawValue, withExtension: nil) {
            if let data = try? Data(contentsOf: file) {
                if let response = try? JSONDecoder().decode(T.self, from: data) {
                    successCallback(response)
                }
                else {
                    let error = NSError(domain:"Decoding error", code: 400, userInfo:nil)
                    failureCallback(error)
                }
            }
            else {
                let error = NSError(domain:"Data not available", code: 400, userInfo:nil)
                failureCallback(error)
            }
        }
        else {
            let error = NSError(domain:"File not available", code: 400, userInfo:nil)
            failureCallback(error)
        }
    }
}

