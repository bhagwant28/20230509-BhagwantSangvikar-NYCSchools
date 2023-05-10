//
//  APIService.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import Foundation

class APIService{

     // Fetch all school List
    func fetchAllSchoolList() async throws -> ([SchoolListModel]) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode([SchoolListModel].self, from: data)
        
        return decodedData
    }
    
    // Fetching Sected School details
    func fetchSchoolDetails(dbn: String) async throws -> (SchoolSATModel) {
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(SchoolSATModel.self, from: data)
        
        return decodedData
    }
}
