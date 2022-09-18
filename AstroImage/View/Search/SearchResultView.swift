//
//  SearchResultView.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import SwiftUI

struct SearchResultView: View {
    
    var title: String
    var date: String
    var imageUrl: URL
    var hdImageUrl: URL
    let formatter: DateFormatter = DateFormatter()
    
    init(for result: APODResponse) {
        self.formatter.dateFormat = "yyyy-MM-dd"
        self.title = result.title
        let rawDate = formatter.date(from: result.date)!
        self.formatter.dateFormat = "MM/dd/yyyy"
        self.date = formatter.string(from: rawDate)
        self.imageUrl = URL(string: result.sdurl)!
        self.hdImageUrl = URL(string: result.hdurl ?? result.sdurl)!
    }
    
    var body: some View {
        NavigationLink {
            Text("Details")
        } label: {
            HStack(alignment: .top) {
                // image
                VStack(alignment: .leading) {
                    Text(date).fontWeight(.semibold)
                    Text(title).fontWeight(.light)
                }
            }
        }
    }
}
