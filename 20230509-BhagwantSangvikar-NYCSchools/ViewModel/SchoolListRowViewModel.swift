//
//  SchoolListRowViewModel.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import Foundation

class SchoolListRowViewModel: ObservableObject {
    private var school: SchoolListModel?
    
    @Published var name: String?
    
    init(school: SchoolListModel){
        if let name = school.school_name {
            self.name = name
        }
    }
}
