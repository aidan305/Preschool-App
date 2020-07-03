//
//  GenericAistearConceptView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 17/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI

struct GenericAistearConceptView: View {
    
    var title: String
    var description: String
    var images: [Image]
    var aistearFourAimsView : AistearFourAimsView
    
    var body: some View {
        ScrollView{
        VStack(alignment: .center, spacing: 30){
        
            ZStack{
                Rectangle()
                    .cornerRadius(10)
                    .lineLimit(9)
                    .foregroundColor(Color("veryLightGrey"))
                    .shadow(radius: 8)
                    .frame(minWidth: 350, maxWidth: .infinity, minHeight: 100, maxHeight: 150)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(title)
                        .font(.custom("Lato-Regular.ttf", size: 22))
                        .foregroundColor(Color("LBPurple"))
                    
                    Text("\(description)")
                        .font(.custom("Lato-Regular.ttf", size: 14))
                }.padding([.trailing, .leading], 4)
                
            }
            
            
            VStack{
                aistearFourAimsView.frame(width: 350, height: 300)
                    .padding(.bottom, 10)
            ZStack{
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color("veryLightGrey"))
                    .shadow(radius: 8)
                
                VStack{
                    HStack{
                        images[0].resizable().cornerRadius(5)
                        .frame(minWidth: 40, maxWidth: 110, minHeight: 70, maxHeight: 160)
                        images[1].resizable().cornerRadius(5)
                        .frame(minWidth: 40, maxWidth: 110, minHeight: 70, maxHeight: 160)
                        images[2].resizable().cornerRadius(5)
                        .frame(minWidth: 40, maxWidth: 110, minHeight: 70, maxHeight: 160)
                    }
                    HStack{
                        VStack{
                            images[3].resizable().cornerRadius(5)
                            .frame(minWidth: 80, maxWidth: 250, minHeight: 70, maxHeight: 160)
                            images[4].resizable().cornerRadius(5)
                            .frame(minWidth: 80, maxWidth: 250, minHeight: 70, maxHeight: 160)
                        }
                        images[5].resizable().cornerRadius(5)
                            .frame(minWidth: 200, maxWidth: 300, minHeight: 150, maxHeight: 300)
                    }
                }.padding(3)
            }
            }
        }.padding([.leading, .trailing])
            .padding(.bottom, 40)
    }
    }
    
}

