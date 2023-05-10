//
//  ContentView.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var isStartActive: Bool = false
    @State private var isStart = false
    var body: some View {
        VStack {
                Image(systemName: "building.columns.circle")
                    .resizable()
            .frame(width: 120, height: 120)
            .foregroundColor(.accentColor)
            HStack {
                Text("NYC")
                    .font(.largeTitle).bold()
                Text("School App")
                    .font(.title)
            }
            .foregroundColor(.accentColor)
            buttonView()
        }
        .padding()
        .navigationDestination(isPresented: $isStartActive) {
            SchoolList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    func buttonView()-> some View {
        Button {
            isStartActive.toggle()
        } label: {
            HStack {
                Image(systemName: "arrowshape.right")
                Text("Start App")
            }
            .foregroundColor(.white)
            .frame(width: 180, height: 44)
            .background(Color.green)
            .cornerRadius(12)
            .shadow(radius: 8)
        }
        .padding(.top, 40)
    }
}
