//
//  ContentView.swift
//  WmpSU01
//
//  Created by gzonelee on 2021/06/18.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject
    var model: WmpListModel = WmpListModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.banners, id: \.id) { banner in
                    NavigationLink(destination: DetailView(banner: banner)) {
                        VStack {
                            Text(banner.bannerTitle)
                            AsyncImage(url: URL(string: banner.pcImgUrl)!)
                                .cornerRadius(10)
                        }
                    }
//                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("위메프")
        }
        .task {
            await model.load()
        }
        .refreshable {
            await model.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
