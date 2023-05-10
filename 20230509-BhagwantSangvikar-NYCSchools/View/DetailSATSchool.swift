//
//  DetailSATSchool.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import SwiftUI

struct DetailSATSchool: View {
    var imageSize: CGFloat = 280
    @StateObject var vm = DetailSATSchoolViewModel(dbn: "")
    var body: some View {
        ScrollView {
            imageView()
            Divider()
                .padding(20)

            VStack(alignment: .leading, spacing: 25) {
                Text("School Name:- \(vm.name ?? "")")
                    .font(.title).bold()
                    .padding(.bottom, 40)
                Text("Num of SAT Test Takers:- \(vm.numOfSatTestTakers ?? "")")
                    .font(.title3)
                    .padding(.bottom, 20)
                Text("SAT Critical Reading Avg. Score:- \(vm.sat_Critical_Reading_Avg_Score ?? "")")
                    .font(.title3)
                    .padding(.bottom, 20)
                Text("SAT Math Avg. Score:- \(vm.sat_Math_Avg_Score ?? "")")
                    .font(.title3)
                    .padding(.bottom, 20)
                Text("SAT Writing Avg. Score:- \(vm.sat_Writing_Avg_Score ?? "")")
                    .font(.title3)
                    .padding(.bottom, 20)
            }
        }
        
    }
}

struct DetailSATSchool_Previews: PreviewProvider {
    static var previews: some View {
        DetailSATSchool()
    }
}

extension DetailSATSchool {
    func imageView() -> some View {
        AsyncImage(url: URL(string: "vm.image")) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()// Displays the loaded image.
            } else if phase.error != nil {
                Image(systemName: "building.columns.circle")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()// Displays the loaded image.
            } else {
                ProgressView()
                    .frame(width: imageSize, height: imageSize) //as placehoder
            }
        }
    }
}
