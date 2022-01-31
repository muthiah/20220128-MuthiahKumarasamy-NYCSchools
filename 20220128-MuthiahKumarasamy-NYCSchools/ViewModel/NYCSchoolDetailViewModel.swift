//
//  NYCSchoolDetailViewModel.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

enum SchoolDetailSections : String {
    case schoolInformation = "Information"
    case detail = "About"
    case scores = "Scores"
    case sports = "Sports"
    case extraCuricularActivities = "ExtraCuricularActivities"
    case languages = "Languages"
}

class NYCSchoolDetailViewModel: BaseViewModel {
    
    var schoolsDetailModels : [NYCSchoolDetailModel]?
    var schoolModel: NYCSchoolModel?
    var sections: [SchoolDetailSections] = []
    
    /// Initiate the NYCSchoolDetailViewModel with the selected school model
    /// - Parameter passThroughData: set the Selected School model
    init(passThroughData:NYCSchoolModel?) {
        self.schoolModel = passThroughData
    }
    
    
    /// Function to fetch the school list from the service
    func getSchoolsDetails() {
        
        NYCSchoolService.shared.getSchoolsDetails { [weak self] response in
            self?.schoolsDetailModels = response
            self?.loadSections()
            self?.reloadUI?()
            
        } failureCallback: {  [weak self] errorDescription in
            self?.loadSections() // reloading the section even the Score information not there to show other section
            self?.reloadUI?()
            self?.showError?(errorDescription ?? "")
        }
    }
    
    
    /// Load the sections based on the Availability
    func loadSections() {
        sections.append(.schoolInformation)
        if !description.isEmpty {
            sections.append(.detail)
        }
        if !(mathsScore.isEmpty && readingScore.isEmpty && writingScore.isEmpty) {
            sections.append(SchoolDetailSections.scores)
        }
        if !extraCuricularActivities.isEmpty {
            sections.append(.extraCuricularActivities)
        }
        if !languages.isEmpty {
            sections.append(.languages)
        }
        if !sports.isEmpty {
            sections.append(.sports)
        }
        
        self.numberOfSections = sections.count
        self.rowsPerSection = 1 // Each has one row
    }
    
    
    /// Get the phoneNumber of the school
    var phoneNumber: String {
        return schoolModel?.phoneNumber ?? ""
    }
    
    /// Get the TotalStudents of the school
    var totalStudents : String {
        var string = ""
        if let studentCount = schoolModel?.totalStudents {
            string =  "Total Students: \(studentCount)"
        }
        return string
    }
    
    /// Get the SchoolName of the school
    var schoolName : String {
        return schoolModel?.schoolName ?? ""
    }
    
    /// Check  the PhoneNumber availabity  of the school
    var isPhoneNumberAvailable: Bool {
        return !phoneNumber.isEmpty
    }
    
    ///   GetSchoolLocation
    /// - Returns: location of the school combination of address, city , zip
    var location : String {
        let school = schoolModel
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
    
    ///   description of the school
    /// - Returns: short description about  the school
    var description : String {
        return schoolModel?.schoolInformation ?? ""
    }
    
    ///   languages available in the school
    /// - Returns: languages of the school
    var languages: String {
        return schoolModel?.languages ?? ""
    }
    
    ///   Sports available in the school
    /// - Returns: Sports of the school
    var sports: String {
        return schoolModel?.sports ?? ""
    }
    
    ///   ExtraCuricular Activities available in the school
    /// - Returns: ExtraCuricular Activities of the school
    var extraCuricularActivities: String {
        return schoolModel?.extracurricularActivities ?? ""
    }
    
    
    /// Get the Section header title
    /// - Parameter index: index of the section
    /// - Returns:  Get the Section header title based on the [SchoolDetailSections]
    func getSectionHeaderTitle(index : Int?) -> String {
        guard let index = index else {
            return  ""
        }
        return sections[index].rawValue
    }
    
    ///   Maths score of the school
    /// - Returns: Maths score of the school
    ///
    var mathsScore: String {
        var string = ""
        if let mathsScore = schoolsDetailModels?.filter({$0.id == schoolModel?.id}).first?.mathsScore {
            string = "Maths Score: \(mathsScore)"
        }
        return string
    }
    
    ///   Reading score of the school
    /// - Returns: Reading score of the school
    ///
    var readingScore:  String {
        var string = ""
        if let readingScore = schoolsDetailModels?.filter({$0.id == schoolModel?.id}).first?.readingScore {
            string = "Reading Score: \(readingScore)"
        }
        return string
    }
    
    ///   Writing score of the school
    /// - Returns: Writing score of the school
    ///
    var writingScore: String {
        var string = ""
        if let readingScore = schoolsDetailModels?.filter({$0.id == schoolModel?.id}).first?.writingScore {
            string = "Writing Score: \(readingScore)"
        }
        return string
    }
    
    
    /// Section Information based on the section
    /// - Parameter index: index of the section
    /// - Returns:  Get the School Values based on the [SchoolDetailSections]
    func getDetailModel(index: Int) -> String {
        let section = sections[index]
        var string = ""
        switch section {
        case .detail:
            string = description
            break
        case .languages:
            string = languages
            break
        case .sports:
            string = sports
            break
        case .extraCuricularActivities:
            string = extraCuricularActivities
            break
        default:
            string = ""
        }
        return string
    }
    
}
