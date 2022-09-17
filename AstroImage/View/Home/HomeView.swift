//
//  HomeView.swift
//  AstroImage
//
//  Created by Roman on 14.09.22.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - ViewModel
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    //MARK: - Detail View Properties
    @State private var detailsExtended: Bool = false
    
    //MARK: - Gesture properties
    @State private var translation: CGFloat = 0
    @State private var lastTranslation: CGFloat = 0
    @GestureState private var gestureTranslation: CGSize = .zero
    
    var body: some View {
        ZStack {
            //MARK: - Background image
            GeometryReader { geo in
                let frame = geo.frame(in: .global)
                APODImage(for: homeVM.data)
                    .frame(width: frame.width, height: frame.height)
            }
            .ignoresSafeArea()
            
            //MARK: - Bottom sheet for details
            GeometryReader { geo in
                //TODO: - The max offset of the extended detail view has
                //TODO: - to be changed to take the container's size
                //TODO: - into account.
                let height = geo.frame(in: .global).height
                let width = geo.frame(in: .global).width
                let containerHeight = geo.frame(in: .local).height
                details
                    .padding(.horizontal)
                    .frame(width: width, height: height)
                    .offset(y: height - 180)
                    .offset(y: translation)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                translation = value.translation.height + lastTranslation
                            })
                            .onEnded({ value in
                                let maxTranslationValue = -containerHeight + 240
                                if value.translation.height < 0 {
                                    withAnimation {
                                        translation = maxTranslationValue
                                        detailsExtended = true
                                    }
                                } else {
                                    withAnimation {
                                        translation = 0
                                        detailsExtended = false
                                    }
                                }
                                lastTranslation = translation
                            })
                    )
            }
        }
        .task {
            await homeVM.getTodaysImage()
        }
    }
    
    var details: some View {
        VStack {
            HomeViewDetails(
                for: homeVM.data,
                extended: $detailsExtended,
                translation: $translation
            )
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
