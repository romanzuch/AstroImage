//
//  SearchDetailVM.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import SwiftUI
import UIKit

class SearchDetailViewModel: ObservableObject {
    
    let apodApi: APODApi = APODApi.singleton
    
    func getImageDownload(for response: APODResponse, inProgress: Binding<Bool>) async -> UIImage? {
        var downloadImage: UIImage?
        inProgress.wrappedValue.toggle()
        if response.hdurl != "" {
            await apodApi.getImageForDownload(for: response.hdurl!) { image in
                downloadImage = image
            }
        } else {
            await apodApi.getImageForDownload(for: response.sdurl) { image in
                downloadImage = image
            }
        }
        inProgress.wrappedValue.toggle()
        return downloadImage
    }
    
}
