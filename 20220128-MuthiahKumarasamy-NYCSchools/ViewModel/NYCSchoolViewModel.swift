//
//  NYCSchoolViewModel.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

class NYCSchoolViewModel: BaseViewModel {
    
    
    var schoolModels: [NYCSchoolModel]?
    
    ///   GetSchoolName
    /// - Parameter index: index of the [NYCSchoolModel]
    /// - Returns: School name of the school

    func getSchoolName(index: Int?) -> String? {
        guard let index = index else {
            return ""
        }
        return schoolModels?[index].schoolName ?? ""
    }
    
    ///   GetSchoolLocation
    /// - Parameter index: index of the [NYCSchoolModel]
    /// - Returns: location of the school combination of address, city , zip
  
    func getSchoolLocation(index: Int?) -> String? {
        guard let index = index else {
            return ""
        }
        
        let school = schoolModels?[index]
        var string = ""
        if let address = school?.address {
            string.append(address)
            string.append(", ")
        }
        if let city = school?.city {
            string.append(city)
            string.append(", ")
        }
        if let zip = school?.zip {
            string.append(zip)
        }
        return string
    }
    
    ///   Check the phone number in the School
    /// - Parameter index: index of the [NYCSchoolModel]
    /// - Returns: check the phonenumber is available for school
    
    func isPhoneNumberAvailable(index: Int?) -> Bool? {
        return !(getPhoneNumber(index: index)?.isEmpty ?? false)
    }
    
    
    ///   Get the phone number in the School
    /// - Parameter index: index of the [NYCSchoolModel]
    /// - Returns: Get the phonenumber for school
    
    func getPhoneNumber(index: Int?) -> String? {
        guard let index = index else {
            return ""
        }
        let school = schoolModels?[index]
        return school?.phoneNumber ?? ""
    }
        
    
    ///   Get the total students in the School
    /// - Parameter index: index of the [NYCSchoolModel]
    /// - Returns: Get the total students for school
    
    func getTotalStudents(index: Int?) -> String? {
        guard let index = index else {
            return ""
        }
        var string = ""
        if let studentCount = schoolModels?[index].totalStudents {
            string =  "Total Students: \(studentCount)"
        }
        return string
    }
    
    /// Function to fetch the school list from the service
    
    func getSchools() {
        NYCSchoolService.shared.getSchools { [weak self] response in
            self?.numberOfSections = 1
            self?.rowsPerSection = response?.count ?? 0
            self?.schoolModels = response
            self?.reloadUI?()
        } failureCallback: { errorDescription in
            self.showError?(errorDescription ?? "")
        }
    }
}
