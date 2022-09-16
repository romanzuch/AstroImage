//
//  HomeViewDetails.swift
//  AstroImage
//
//  Created by Roman on 16.09.22.
//

import SwiftUI

struct HomeViewDetails: View {
    
    let response: APODResponse
    @Binding var viewExtended: Bool
    @Binding var translation: CGFloat
    
    init(for response: APODResponse, extended: Binding<Bool>, translation: Binding<CGFloat>) {
        self.response = response
        self._viewExtended = extended
        self._translation = translation
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Spacer()
                Image(systemName: viewExtended || translation < -300 ? "chevron.down" : "chevron.up").foregroundColor(.white)
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
            //TODO: - Write a method to calculate the opacity starting after the view has been slided just a bit, rather than from the beginning
                .opacity(viewExtended ? 1 : -translation/200)
        }
    }
}
