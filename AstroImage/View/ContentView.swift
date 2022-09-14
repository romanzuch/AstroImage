//
//  ContentView.swift
//  AstroImage
//
//  Created by Roman on 13.09.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label {
                        Text("AstroImage")
                    } icon: {
                        Image(systemName: "photo")
                    }

                }
            SearchView()
                .tabItem {
                    Label {
                        Text("Search")
                    } icon: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            MoreView()
                .tabItem {
                    Label {
                        Text("More")
                    } icon: {
                        Image(systemName: "ellipsis")
                    }

                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
