//
//  MoreView.swift
//  AstroImage
//
//  Created by Roman on 14.09.22.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // here come the settings
                }
                List {
                    // here comes something more
                }
            }
            .navigationTitle("More")
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
