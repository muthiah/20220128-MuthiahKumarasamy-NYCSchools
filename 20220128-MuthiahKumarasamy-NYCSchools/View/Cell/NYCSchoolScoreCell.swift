//
//  NYCSchoolScoreCell.swift
//  20220128-MuthiahKumarasamy-NYCSchools
//
//  Created by Muthiah Kumarasamy on 1/29/22.
//

import UIKit

class NYCSchoolScoreCell: UITableViewCell {
    
    @IBOutlet weak var labelMaths: UILabel!
    @IBOutlet weak var labelWriting: UILabel!
    @IBOutlet weak var labelReading: UILabel!
    
    func setViewModel(viewModel: NYCSchoolDetailViewModel?) {
        labelMaths.text = viewModel?.mathsScore
        labelWriting.text = viewModel?.writingScore
        labelReading.text = viewModel?.readingScore
    }
    
}
