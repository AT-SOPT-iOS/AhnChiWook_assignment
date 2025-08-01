//
//  ContentView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 5/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HeaderView()
                Image("image 19")
                Top20View()
                LiveView()
                PopularMovieView()
                Spacer()
                TeamListView()
                Spacer()
                ServiceListView()
                Top6View()
                BottomView()
            }
        }.background(Color.black)
    }
}
