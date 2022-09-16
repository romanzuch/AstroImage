//
//  HomeView.swift
//  AstroImage
//
//  Created by Roman on 14.09.22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    @State private var translation: CGSize = .zero
    
    var body: some View {
        ZStack {
            AsyncImage(
                url: homeVM.getSDImageUrl(from: homeVM.testData.sdurl)) { image in
                    ZStack {
                        image
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
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            details
        }
    }
    
    var details: some View {
        Text("Here comes the details")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
