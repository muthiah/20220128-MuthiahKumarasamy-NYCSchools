//
//  NYCSchoolDescriptionCell.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

class NYCSchoolDescriptionCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    
    ///   setViewModel for the NYCSchoolModel description
    /// - Parameter index: viewModel of the  NYCSchoolDetailViewModel
    func setViewModel(viewModel: NYCSchoolDetailViewModel? , index: Int) {
        labelDescription.text = viewModel?.getDetailModel(index: index)
    }
     
}
