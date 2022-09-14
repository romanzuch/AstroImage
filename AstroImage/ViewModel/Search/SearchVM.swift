//
//  SearchVM.swift
//  AstroImage
//
//  Created by Roman on 14.09.22.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    // MARK: - Date Picker Wrapper
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    
}
