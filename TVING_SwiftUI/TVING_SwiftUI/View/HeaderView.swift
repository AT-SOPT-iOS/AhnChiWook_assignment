//
//  HeaderView.swift
//  TVING_SwiftUI
//
//  Created by 안치욱 on 5/28/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("tving2")
                .frame(width: 191, height: 78, alignment: .leading)
            HStack{
                Spacer()
                Image("Search")
                Image("profile")
            }            
            Spacer()
        }.background(.black)
    }
}

