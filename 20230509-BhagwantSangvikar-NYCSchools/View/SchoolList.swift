//
//  SchoolList.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import SwiftUI

struct SchoolList: View {
    @StateObject var vm = SchoolListViewModel()
    
    var body: some View {
            List {
                ForEach(vm.schoolList) { school in
                    NavigationLink {
                        DetailSATSchool(vm: DetailSATSchoolViewModel(dbn: school.dbn ?? ""))
                    } label: {                       
                        SchoolListRow(vm: SchoolListRowViewModel(school: school))
                            .listRowInsets(.init())
                    }
                }
            }
            .navigationTitle("NYC High schools")
        }
}

struct SchoolList_Previews: PreviewProvider {
    static var previews: some View {
        SchoolList()
    }
}
