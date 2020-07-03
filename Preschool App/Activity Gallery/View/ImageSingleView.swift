//
//  ImageSingleView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 09/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI
import URLImage

struct ImageSingleView : View {
    
    @Binding var selectedImage : String
    @Binding var show : Bool
    
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        GeometryReader{_ in
            VStack{
                URLImage(URL(string: self.selectedImage)!) { proxy in
                    proxy.image
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Fill the frame
                        .clipped()                       // Clip overlaping parts
                }
                .scaleEffect(self.scale)
                .gesture(MagnificationGesture()
                .onChanged { value in
                    self.scale = value.magnitude
                })            }
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height / 1.5)
                .background(Color.white)
                .cornerRadius(12)
        }
        .background(Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
        .onTapGesture {
            
            self.show.toggle()
            
        })
    }
}


