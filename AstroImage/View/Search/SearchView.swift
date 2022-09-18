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
                HStack(alignment: .bottom) {
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
                    Spacer()
                    Button {
                        Task {
                            await searchVM.getImagesFromDateRange()
                        }
                    } label: {
                        Text("Search")
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                Spacer()
                // here comes the results list
                if let data = searchVM.data {
                    Form {
                        ForEach(data, id: \.id) { result in
                            SearchResultView(for: result)
                        }
                    }
                    
                } else {
                    Text("Click search to display results")
                }
                Spacer()
            }
            .ignoresSafeArea(.container, edges: .bottom)
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
