//
//  HomeViewDetails.swift
//  AstroImage
//
//  Created by Roman on 16.09.22.
//

import SwiftUI

struct HomeViewDetails: View {
    
    let response: APODResponse
    
    init(for response: APODResponse) {
        self.response = response
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Spacer()
                Image(systemName: "chevron.up")
                    .foregroundColor(.white)
                Spacer()
            }
            Text(response.date)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(response.title)
                .font(.title)
                .foregroundColor(.white)
            Text(response.explanation)
                .foregroundColor(.white)
        }
    }
}

struct HomeViewDetails_Previews: PreviewProvider {
    static let homeVM: HomeViewModel = HomeViewModel()
    static var previews: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            HomeViewDetails(for: homeVM.testData)
        }
    }
}
