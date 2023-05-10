//
//  DetailSATSchoolViewModel.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import Foundation
@MainActor
class DetailSATSchoolViewModel:ObservableObject {
    var dbn: String?
    
    @Published var school: SchoolSATModel?
    @Published var name: String? = ""
    @Published var numOfSatTestTakers: String? = ""
    @Published var sat_Critical_Reading_Avg_Score: String? = ""
    @Published var sat_Math_Avg_Score: String? = ""
    @Published var sat_Writing_Avg_Score: String? = ""
    
    
    init(dbn: String){
        let dbn1 = dbn
        self.dbn = dbn1
        self.doRegularWork()
    }
    
    func doRegularWork() {
        Task {
            await getSchoolDetails()
        }
    }
    
    
    func getSchoolDetails() async {
        Task {
            do {
                school = try await APIService().fetchSchoolDetails(dbn: dbn ?? "")
                if let satResponse = school, (satResponse.count == 1) {
                    self.name = school?[0].schoolName
                    self.numOfSatTestTakers = school?[0].numOfSatTestTakers
                    self.sat_Critical_Reading_Avg_Score = school?[0].satCriticalReadingAvgScore
                    self.sat_Math_Avg_Score = school?[0].satMathAvgScore
                    self.sat_Writing_Avg_Score = school?[0].satWritingAvgScore
                }
                
            } catch {
                print("Error getting: \(error)")
            }
        }
    }
    
}
