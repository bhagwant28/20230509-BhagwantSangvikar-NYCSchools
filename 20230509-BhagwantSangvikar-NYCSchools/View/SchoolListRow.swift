//
//  SchoolListRow.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import SwiftUI

struct SchoolListRow: View {
    var imageSize: CGFloat = 80
    var vm: SchoolListRowViewModel
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray)
            HStack {
                imageView()
                    .padding(.leading, 10)
                VStack(alignment: .leading, spacing: 5) {
                    Text(vm.name ?? "")
                        .font(.system(size: 21, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }.padding(.trailing, 10)
                Spacer()
            }
        }
        .modifier(CardModifier())
        .padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}

//struct SchoolListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SchoolListRow()
//    }
//}

extension SchoolListRow {
    func imageView() -> some View {
        AsyncImage(url: URL(string: "vm.image")) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()// Displays the loaded image.
            } else if phase.error != nil {
//                Text(phase.error?.localizedDescription ?? "error")
//                    .foregroundColor(Color.pink)
//                    .frame(width: imageSize, height: imageSize)// Indicates an error.
                  Image(systemName: "building.columns.circle")
                    .resizable()
                    .foregroundColor(.white)
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
