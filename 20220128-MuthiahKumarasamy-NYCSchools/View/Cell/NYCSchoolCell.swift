//
//  NYCSchoolCell.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit


protocol NYCSchoolCellDelegate: AnyObject {
    func didTapPhoneNumber(phoneNumber: String?)
}


class NYCSchoolCell: UITableViewCell {
    
    @IBOutlet weak var labelSchoolLocation: UILabel!
    @IBOutlet weak var labelSchoolName: UILabel!
    @IBOutlet weak var buttonPhoneNumber: UIButton!
    @IBOutlet weak var labelStudentsCount: UILabel!
    
    weak var delegate: NYCSchoolCellDelegate?
    var viewModel: NYCSchoolViewModel?
    var detailViewModel: NYCSchoolDetailViewModel?
    var index: Int?
    
    
    func setViewModel (viewModel: NYCSchoolViewModel?, index: Int?) {
        self.index = index
        self.viewModel = viewModel
        labelSchoolName.text = self.viewModel?.getSchoolName(index: index)
        labelSchoolLocation.text = self.viewModel?.getSchoolLocation(index: index)
        labelStudentsCount.text = self.viewModel?.getTotalStudents(index: index)
        buttonPhoneNumber.isHidden = !(self.viewModel?.isPhoneNumberAvailable(index: index) ?? true)
    }
    
    
    func setDetailViewModel (viewModel: NYCSchoolDetailViewModel?) {
        self.detailViewModel = viewModel
        labelSchoolName.text = self.detailViewModel?.schoolName
        labelSchoolLocation.text = self.detailViewModel?.location
        labelStudentsCount.text = self.detailViewModel?.totalStudents
        buttonPhoneNumber.isHidden = !(self.detailViewModel?.isPhoneNumberAvailable ?? true)
    }

    @IBAction func didTapPhoneNumber(_ sender: UIButton) {
        if let index = index , let viewModel = viewModel {
            self.delegate?.didTapPhoneNumber(phoneNumber: viewModel.getPhoneNumber(index: index))
        }
        else if let detailViewModel = detailViewModel {
            self.delegate?.didTapPhoneNumber(phoneNumber: detailViewModel.phoneNumber)
        }
    }
    
}
