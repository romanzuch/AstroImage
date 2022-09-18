//
//  SearchResultView.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import SwiftUI

struct SearchResultView: View {
    
    var result: APODResponse
    var title: String
    var date: String
    var imageUrl: URL
    var hdImageUrl: URL
    let formatter: DateFormatter = DateFormatter()
    
    //MARK: - View Model
    let searchResultVM: SearchResultViewModel = SearchResultViewModel()
    
    init(for result: APODResponse) {
        self.result = result
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
            SearchDetailView(for: result)
        } label: {
            HStack {
                APODImage(for: result, type: .full)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(date).fontWeight(.semibold)
                    Text(title).fontWeight(.light)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}
