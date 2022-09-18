//
//  HomeVM.swift
//  AstroImage
//
//  Created by Roman on 16.09.22.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var data: APODResponse = APODResponse()
    
    func getSDImageUrl(from string: String) -> URL {
        return URL(string: string)!
    }
    
    //MARK: - API Methods relevant to the Home View
    let apodApi: APODApi = APODApi.singleton
    func getTodaysImage() async {
        await apodApi.getTodaysImage() { apiResponse in
            if let response = apiResponse {
                DispatchQueue.main.async {
                    self.data = response
                }
            } else {
                debugPrint("There was an error retrieving the data.")
            }
        }
    }
}
