//
//  SearchDetailView.swift
//  AstroImage
//
//  Created by Roman on 18.09.22.
//

import SwiftUI

struct SearchDetailView: View {
    
    var result: APODResponse
    @State private var showInfo: Bool = false
    let searchDetailVM: SearchDetailViewModel = SearchDetailViewModel()
    
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
            //MARK: - Foreground info screen
            Group {
                if showInfo {
                    details
                }
            }
        }.toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    showInfo.toggle()
                } label: {
                    Image(systemName: showInfo ? "info.circle.fill" : "info.circle")
                }
                Button {
                    Task {
                        guard let image = await searchDetailVM.getImageDownload(for: result) else { return }
                        let imageSaver = ImageSaver()
                        imageSaver.writeToPhotoAlbum(image: image)
                    }
                } label: {
                    Image(systemName: "arrow.down.circle")
                }
            }
        }
    }
    
    var details: some View {
        VStack {
            Text(result.title)
                .font(.title)
                .padding(.bottom)
            ScrollView(.vertical, showsIndicators: false) {
                Text(result.explanation)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 64)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
    }
    
}