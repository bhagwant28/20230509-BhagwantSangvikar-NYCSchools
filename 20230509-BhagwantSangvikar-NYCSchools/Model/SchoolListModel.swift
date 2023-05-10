//
//  SchoolListModel.swift
//  20230509-BhagwantSangvikar-NYCSchools
//
//  Created by Bhagwant Sangvikar on 09/05/23.
//

import Foundation

typealias SchoolListModelString = [[String: String]]

extension Array where Element == SchoolListModelString.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(SchoolListModelString.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

struct SchoolListModel : Codable, Identifiable {
    var id: UUID?
    let dbn : String?
    let school_name : String?
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case school_name = "school_name"
    }
    
    init(from decoder: Decoder) throws {
        id = UUID()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dbn = try values.decodeIfPresent(String.self, forKey: .dbn)
        school_name = try values.decodeIfPresent(String.self, forKey: .school_name)
    }
    
}
