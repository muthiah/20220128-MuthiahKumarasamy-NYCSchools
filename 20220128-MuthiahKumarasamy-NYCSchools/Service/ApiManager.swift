//
//  ApiManager.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit


/// Base Url config
enum Environment:String {
    case baseUrl = "https://data.cityofnewyork.us/"
}

/// End point path of the Api
enum EndPoint:String {
    case schoolList = "resource/s3k6-pzi2.json"
    case schoolDetail = "resource/f9bf-2cp4.json"
}

/// APIRequestHelper for form the request and environment mapping
struct APIRequestHelper {
    static let environment = Environment.baseUrl.rawValue
    
    static func service(endPoint: EndPoint) -> String? {
        return  APIRequestHelper.environment + endPoint.rawValue
    }
    
    static func formrequest(with api: EndPoint) -> URLRequest? {
        guard let urlString = service(endPoint: api) else {
            return nil
        }
        guard let url = URL.init(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod  = "GET"
        return request
    }
}

class ApiManager {
    
    static let shared = ApiManager()
    
    ///   fetchDataFrom the webservice
    /// - Parameter : Model.Type (decodable) , Ednpoint path
    /// - Returns: successCallback : ->  Model data
    ///             failureCallback: -> Return Error
    ///
    func fetchDataFromService<T:Decodable>(model:T.Type, api:EndPoint, successCallback: (@escaping (_ model:T?) -> Void) , failureCallback: (@escaping (_ error:Error?) -> Void))  {
        
        guard let request = APIRequestHelper.formrequest(with: api) else {
            failureCallback(nil)
            return
        }
        
        URLSession.shared.dataTask(with:request) { (data, response, error) in
            if let data = data , let response = try? JSONDecoder().decode(T.self, from: data){
                successCallback(response)
            }
            else {
                failureCallback(error)
            }
        }.resume()
    }
}

