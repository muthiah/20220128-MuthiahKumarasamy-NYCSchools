//
//  NYCSchoolService.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

class NYCSchoolMockService {

    static let shared = NYCSchoolMockService()
    
    func getSchools( successCallback: (@escaping (_ model:[NYCSchoolModel]?) -> Void) , failureCallback: @escaping ( _ errorDescription: String?) -> Void) {
    
        ApiMockManager.shared.fetchDataFromDisk(model: [NYCSchoolModel].self, api: .schoolList) { model in
            successCallback(model)
        } failureCallback: { error in
            failureCallback(error?.localizedDescription)
        }
    }
    
    func getSchoolsDetails(successCallback: @escaping ( _ response: [NYCSchoolDetailModel]?) -> Void , failureCallback: @escaping ( _ errorDescription: String?) -> Void) {
        ApiMockManager.shared.fetchDataFromDisk(model: [NYCSchoolDetailModel].self, api: .schoolDetail) { model in
            successCallback(model)
        } failureCallback: { error in
            failureCallback(error?.localizedDescription)
        }
    }
        
}
