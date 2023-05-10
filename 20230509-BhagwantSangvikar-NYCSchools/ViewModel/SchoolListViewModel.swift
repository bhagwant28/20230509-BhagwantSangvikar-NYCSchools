//
//  SchoolListViewModel.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import Foundation
@MainActor
class SchoolListViewModel: ObservableObject {
    @Published var schoolList = [SchoolListModel]()

    
    init() {
        self.doRegularWork()
        
    }
    
    func doRegularWork() {
        Task {
                await getSchoolList()
        }
    }
    
    
    func getSchoolList() async {
        Task {
            do {
                schoolList = try await APIService().fetchAllSchoolList()
            } catch {
                print("Error getting: \(error)")
            }
        }
    }
}
