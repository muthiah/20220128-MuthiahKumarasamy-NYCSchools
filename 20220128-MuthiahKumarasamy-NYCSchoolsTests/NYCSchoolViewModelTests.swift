//
//  NYCSchoolViewModelTest.swift
//  20220128-MuthiahKumarasamy-NYCSchoolsTests
//
//  Created by Muthiah Kumarasamy on 1/30/22.
//

import XCTest
@testable import _0220128_MuthiahKumarasamy_NYCSchools

class NYCSchoolViewModelTests: XCTestCase {

    var testViewModel: NYCSchoolViewModel!

    override func setUp() {
        testViewModel = NYCSchoolViewModel()
        NYCSchoolMockService.shared.getSchools { [weak self] response in
            self?.testViewModel.schoolModels = response
            XCTAssert((response?.count ?? 0 > 0), "No schools are there")
        } failureCallback: { errorDescription in
            XCTAssert(false,String(errorDescription ?? ""))
        }
    }

    func testSchoolName() {
        XCTAssertNotEqual(self.testViewModel.getSchoolName(index: 0), "", "School name is not there")
    }
    
    func testLocation(){
        XCTAssertNotEqual(self.testViewModel.getSchoolLocation(index: 0), "", "No location data for the school \(self.testViewModel.getSchoolName(index: 0) ?? "")")
    }
    
    func testTotalStudents(){
        XCTAssertNotEqual(self.testViewModel.getTotalStudents(index: 0), "", "No Students data for the school \(self.testViewModel.getSchoolName(index: 0) ?? "")")
    }
    
    func testPhoneNumberAvailable() {
        XCTAssertNotEqual(self.testViewModel.isPhoneNumberAvailable(index: 0), false, "No Phone Number data for the school \(self.testViewModel.getSchoolName(index: 0) ?? "")")
    }
    
    func testPhoneNumber() {
        XCTAssertNotEqual(self.testViewModel.getPhoneNumber(index: 0), "", " No Phone Number data for the school \(self.testViewModel.getSchoolName(index: 0) ?? "")")
    }
}
