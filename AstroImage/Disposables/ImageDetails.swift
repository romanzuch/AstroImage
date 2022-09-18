//
//  ImageDetails.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import SwiftUI

struct ImageDetails: View {
    let response: APODResponse
    var date: String
    @Binding var viewExtended: Bool
    @Binding var translation: CGFloat
    let formatter: DateFormatter = DateFormatter()
    
    init(for response: APODResponse, extended: Binding<Bool>, translation: Binding<CGFloat>) {
        self.response = response
        let rawDate = Date()
        self.formatter.dateFormat = "MM/dd/yyyy"
        self.date = formatter.string(from: rawDate)
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
            Text(date)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(response.title)
                .font(.title)
                .foregroundColor(.white)
            Group {
                if viewExtended {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(response.explanation)
                            .foregroundColor(.white)
                            .padding(.bottom, 80)
                        //TODO: - Write a method to calculate the opacity starting after the view has been slided just a bit, rather than from the beginning
                            .opacity(viewExtended ? 1 : -translation/200)
                    }
                } else {
                    Text(response.explanation)
                        .foregroundColor(.white)
                    //TODO: - Write a method to calculate the opacity starting after the view has been slided just a bit, rather than from the beginning
                        .opacity(viewExtended ? 1 : -translation/200)
                }
            }
        }
    }
}
