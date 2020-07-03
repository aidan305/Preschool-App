//
//  AistearFourAimsView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 22/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI

struct AistearFourAimsView: View {
    let color: Color
    let aim1 : String
    let aim2 : String
    let aim3 : String
    let aim4 : String
    let imageTitle: String
    
    
    var body: some View {
        
        ZStack{
            Image(imageTitle)
                .border(color, width: 10)
            
            VStack{
                HStack{
                    aimCirleView(aimNumber: 1, aimText: aim1, color: color)
                    Spacer()
                    aimCirleView(aimNumber: 2, aimText: aim2, color: color)
                }
                Spacer()
                HStack{
                    aimCirleView(aimNumber: 3, aimText: aim3, color: color)
                    Spacer()
                    aimCirleView(aimNumber: 4, aimText: aim4, color: color)
                }
            }
        }
    }
}

struct aimCirleView: View {
    
    let aimNumber: Int
    let aimText: String
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 130, height: 130)
                .shadow(radius: 5)
            VStack(){
                Text("Aim \(aimNumber)")
                    .font(.custom("Lato-Bold.ttf", size: 16))
                Text(aimText)
                    .font(.custom("Lato-Regular.ttf", size: 14))
                    .frame(alignment: .center)
            }
            .frame(width: 120)
            .lineLimit(5)
            .foregroundColor(.white)
        
            
        }
    }
}


