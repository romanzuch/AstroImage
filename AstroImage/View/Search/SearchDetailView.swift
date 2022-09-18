//
//  SearchDetailView.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import SwiftUI

struct SearchDetailView: View {
    
    var result: APODResponse
    let searchDetailVM: SearchDetailViewModel = SearchDetailViewModel()
    @State private var downloadInProgress: Bool = false
    
    //MARK: - Gesture properties
    @State private var translation: CGFloat = 0
    @State private var lastTranslation: CGFloat = 0
    @GestureState private var gestureTranslation: CGSize = .zero
    
    //MARK: - Detail View Properties
    @State private var detailsExtended: Bool = false
    
    init(for result: APODResponse) {
        self.result = result
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                let frame = geo.frame(in: .global)
                APODImage(for: result, type: .full)
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
                let maxTranslationValue = -containerHeight + 240
                details
                    .background {
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 3)
                            .offset(y: height + 320) // tab bar height 83px
                            .foregroundColor(.black)
                            .opacity(translation == 0 ? 0 : 0.3)
                    }
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
        }.toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    Task {
                        guard let image = await searchDetailVM.getImageDownload(for: result, inProgress: $downloadInProgress) else { return }
                        let imageSaver = ImageSaver()
                        imageSaver.writeToPhotoAlbum(image: image)
                    }
                } label: {
                    Group {
                        if !downloadInProgress {
                            Image(systemName: "arrow.down.circle")
                        } else {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .tint(.accentColor)
                        }
                    }
                }
                
                Button {
                    debugPrint("Share")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
    
    var details: some View {
        VStack {
            ImageDetails(
                for: result,
                extended: $detailsExtended,
                translation: $translation
            )
            Spacer()
        }
    }
    
}
