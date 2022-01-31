//
//  NYCSchoolDetailModel.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/28/22.
//

import UIKit

class NYCSchoolDetailModel: Decodable {

    var satTestTakers: String?
    var readingScore: String?
    var mathsScore: String?
    var writingScore: String?
    var id : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case satTestTakers = "num_of_sat_test_takers"
        case readingScore = "sat_critical_reading_avg_score"
        case mathsScore = "sat_math_avg_score"
        case writingScore = "sat_writing_avg_score"
    }
}
