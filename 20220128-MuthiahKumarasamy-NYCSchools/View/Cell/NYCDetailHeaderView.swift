//
//  NYCDetailHeaderView.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

class NYCDetailHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var labelSectionTitle: UILabel!
    
    ///   Set the header section title
    /// - Parameter index: viewModel of the  NYCSchoolDetailViewModel , index is the Indexpath.section
    func setViewModel(viewModel:NYCSchoolDetailViewModel? , index: Int?) {
        labelSectionTitle.text = viewModel?.getSectionHeaderTitle(index: index)
    }


}
