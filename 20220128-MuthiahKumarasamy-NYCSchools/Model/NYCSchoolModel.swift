//
//  NYCSchoolModel.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

class NYCSchoolModel: Decodable {
    
    var schoolName: String?
    var schoolInformation: String?
    var location: String?
    var city: String?
    var zip: String?
    var languages: String?
    var phoneNumber: String?
    var address : String?
    var stateCode : String?
    var extracurricularActivities : String?
    var totalStudents : String?
    var sports : String?
    var id : String?

    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case id = "dbn"
        case schoolInformation = "overview_paragraph"
        case languages = "language_classes"
        case phoneNumber = "phone_number"
        case address = "primary_address_line_1"
        case stateCode = "state_code"
        case extracurricularActivities = "extracurricular_activities"
        case totalStudents = "total_students"
        case sports = "school_sports"
        case location
        case zip
        case city
    }
}
