//
//  APODImage.swift
//  AstroImage
//
//  Created by Roman on 16.09.22.
//

import SwiftUI

struct APODImage: View {
    
    var apodResponse: APODResponse
    var type: ImageType
    
    init(for response: APODResponse, type: ImageType) {
        self.apodResponse = response
        self.type = type
    }
    
    var body: some View {
        AsyncImage(
            url: URL(string: apodResponse.sdurl)) { image in
                ZStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    if type == .full {
                        // some linear gradient on top of the image
                        // to increase visibility of the tab bar
                        LinearGradient(colors: [
                            .white.opacity(0),
                            .white.opacity(0),
                            .white.opacity(0),
                            .white.opacity(0),
                            .white
                        ], startPoint: .top, endPoint: .bottom)
                    }
                }
            } placeholder: {
                ProgressView()
                    .progressViewStyle(.circular)
            }
    }
}
