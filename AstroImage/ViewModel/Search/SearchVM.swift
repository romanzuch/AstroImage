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
    
    // MARK: - Response data
    @Published var data: [APODResponse]?
    
    //MARK: - API Methods relevant to the Home View
    let apodApi: APODApi = APODApi.singleton
    func getImagesFromDateRange() async {
        await apodApi.getImagesFromDateRange(from: startDate, to: endDate) { apiResponse in
            DispatchQueue.main.async {
                self.data = apiResponse
            }
        }
    }
    
}
