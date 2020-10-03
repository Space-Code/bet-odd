//
//  LoadingView.swift
//  bet odd
//
//  Created by Rodrigo Santos on 02/10/20.
//

import SwiftUI


struct LoadingView: View {
    var body: some View {
       LottieRepresentable(filename: "loading")
            .frame(width: 200, height: 200)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
