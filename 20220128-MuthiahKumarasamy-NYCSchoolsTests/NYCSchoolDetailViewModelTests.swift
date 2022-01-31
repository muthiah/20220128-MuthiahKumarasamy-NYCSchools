//
//  NYCSchoolDetailViewModelTests.swift
//  20220128-MuthiahKumarasamy-NYCSchoolsTests
//
//  Created by Muthiah Kumarasamy on 1/30/22.
//

import XCTest
@testable import _0220128_MuthiahKumarasamy_NYCSchools


class NYCSchoolDetailViewModelTests: XCTestCase {

    var testViewModel: NYCSchoolDetailViewModel!
    
    override func setUp() {
        
        NYCSchoolMockService.shared.getSchools { [weak self] response in
            XCTAssert((response?.count ?? 0 > 0), "No schools are there")
            let passThroughData = NYCSchoolDetailViewModel(passThroughData: response?.randomElement()) // fetching random School data for testing
            self?.testViewModel = passThroughData
        } failureCallback: { errorDescription in
            XCTAssert(false, String(errorDescription ?? ""))
        }
        
        NYCSchoolMockService.shared.getSchoolsDetails { [weak self] response in
            XCTAssert((response?.count ?? 0 > 0), "No School Details are there")
            self?.testViewModel.schoolsDetailModels  = response
            self?.testViewModel.loadSections()
        } failureCallback: { errorDescription in
            XCTAssert(false, String(errorDescription ?? ""))
        }
    }
    
    func testMathsScore(){
        XCTAssertNotEqual(self.testViewModel.mathsScore, "", "No maths score are presented for this school \(self.testViewModel.schoolName)")
    }
    
    func testWritingScore(){
        XCTAssertNotEqual(self.testViewModel.writingScore , "", "No writing score are presented for this school \(self.testViewModel.schoolName)")
    }
    
    func testReadingScore(){
        XCTAssertNotEqual(self.testViewModel.readingScore, "",  "No reading score are presented for this school \(self.testViewModel.schoolName)")
    }
    
    func testSports(){
        XCTAssertNotEqual(self.testViewModel.sports, "" , "No sports data are presented for this school \(self.testViewModel.schoolName)")
    }
    
    func testExtraCuricularActivities(){
        XCTAssertNotEqual(self.testViewModel.extraCuricularActivities, "", "No ExtraCuricular Activities are presented for  this school \(self.testViewModel.schoolName)")
    }
    
    func testLanguages(){
        XCTAssertNotEqual(self.testViewModel.languages, "" , "No languages data are presented for this school \(self.testViewModel.schoolName)")
    }
    
    func testSchoolName() {
        XCTAssertNotEqual(self.testViewModel.schoolName, "", "School name is not there")
    }
    
    func testLocation(){
        XCTAssertNotEqual(self.testViewModel.location, "", "No location data for the school \(self.testViewModel.schoolName)")
    }
    
    func testTotalStudents(){
        XCTAssertNotEqual(self.testViewModel.totalStudents, "", "No Students data for the school \(self.testViewModel.schoolName)")
    }
    
    func testPhoneNumberAvailable() {
        XCTAssertNotEqual(self.testViewModel.isPhoneNumberAvailable, false, "No Phone Number data for the school \(self.testViewModel.schoolName)")
    }
    
    func testPhoneNumber() {
        XCTAssertNotEqual(self.testViewModel.phoneNumber, "", " No Phone Number data for the school \(self.testViewModel.schoolName)")
    }
    
}
