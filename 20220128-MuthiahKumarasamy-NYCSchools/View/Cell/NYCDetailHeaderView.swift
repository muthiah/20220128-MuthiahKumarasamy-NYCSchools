//
//  NYCDetailHeaderView.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

class NYCDetailHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var labelSectionTitle: UILabel!
    
    func setViewModel(viewModel:NYCSchoolDetailViewModel? , index: Int?) {
        labelSectionTitle.text = viewModel?.getSectionHeaderTitle(index: index)
    }


}
