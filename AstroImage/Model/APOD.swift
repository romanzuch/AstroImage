//
//  APOD.swift
//  AstroImage
//
//  Created by Roman on 16.09.22.
//

import Foundation

struct APODResponse: Codable {
    var author: String? = ""
    var date: String = ""
    var explanation: String = ""
    var hdurl: String? = ""
    var sdurl: String = ""
    var type: String = ""
    var title: String = ""
    
    enum CodingKeys: String, CodingKey {
        case author = "copyright"
        case sdurl = "url"
        case type = "media_type"
        case date, explanation, hdurl, title
    }
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        date = try container.decode(String.self, forKey: .date)
        explanation = try container.decode(String.self, forKey: .explanation)
        hdurl = try container.decodeIfPresent(String.self, forKey: .hdurl)
        sdurl = try container.decode(String.self, forKey: .sdurl)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decode(String.self, forKey: .title)
    }
    
    //MARK: - Test Data
    init(
        author: String,
        date: String,
        explanation: String,
        hdurl: String,
        sdurl: String,
        type: String,
        title: String
    ) {
        self.author = author
        self.date = date
        self.explanation = explanation
        self.hdurl = hdurl
        self.sdurl = sdurl
        self.type = type
        self.title = title
    }
    
}
