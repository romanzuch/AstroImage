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
            //MARK: - Background image
            GeometryReader { geo in
                let frame = geo.frame(in: .global)
                APODImage(for: homeVM.testData)
                    .frame(width: frame.width, height: frame.height)
            }
            .ignoresSafeArea()
            
            //MARK: - Bottom sheet for details
            GeometryReader { geo in
                let height = geo.frame(in: .global).height
                let width = geo.frame(in: .global).width
                details
                    .padding(.horizontal)
                    .frame(width: width, height: height)
                    .offset(y: height - 180)
            }
        }
    }
    
    var details: some View {
        VStack {
            HomeViewDetails(for: homeVM.testData)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
