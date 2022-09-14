//
//  SearchView.swift
//  AstroImage
//
//  Created by Roman on 14.09.22.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - View Model Instance
    @StateObject private var searchVM: SearchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // here comes the date picker
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("From")
                        DatePicker("", selection: $searchVM.startDate, displayedComponents: .date)
                            .fixedSize()
                            .onChange(of: searchVM.startDate) { newValue in
                                if newValue > searchVM.endDate {
                                    searchVM.endDate = newValue
                                }
                            }
                    }
                    Spacer()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("To")
                        DatePicker("", selection: $searchVM.endDate, displayedComponents: .date)
                            .fixedSize()
                            .onChange(of: searchVM.endDate) { newValue in
                                if newValue < searchVM.startDate {
                                    searchVM.startDate = newValue
                                }
                            }
                    }
                }.padding(.horizontal, 16)
                // here comes the results list
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
