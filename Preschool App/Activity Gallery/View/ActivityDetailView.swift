//
//  ImageDetailView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 06/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI
import URLImage


struct ActivityDetailView: View {
    
    let urlStrings: [String]
    let title: String
    let date: String
    let description: String
    
    @State var showingSingleImageView = false
    @State var selectedImage = ""
    
    let defaultImage = URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F53639401%2Fhtml-failed-parsing-srcset-attribute-value-since-it-has-an-unknown-descriptor&psig=AOvVaw3vK_lEeRWJlQv7FqshI9Pu&ust=1591787998914000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJCoxsPO9OkCFQAAAAAdAAAAABAE")!
    
    var body: some View {
        ZStack{
        ScrollView{
            VStack{
                ZStack{
                    Rectangle()
                        .cornerRadius(10)
                        .lineLimit(9)
                        .foregroundColor(Color("veryLightGrey"))
                    
                    VStack(spacing: 5){
                        Text("\(title)")
                            .font(.custom("Lato-Bold.ttf", size: 27))
                            .foregroundColor(Color("LBPurple"))
                        Text("\(date)")
                        .font(.custom("Lato-Bold.ttf", size: 16))
                            .foregroundColor(Color.gray)
                        //Spacer()
                        Text("\(description)")
                            .font(.custom("Lato-Regular.ttf", size: 16))
                        
                    }.padding(4)
                }
                .padding([.trailing, .leading], 10)
                .shadow(radius: 10)
                
                ForEach(0..<urlStrings.count, id: \.self) {index in
                    URLImage(URL(string: self.urlStrings[index]) ?? self.defaultImage) { proxy in
                        proxy.image
                            .resizable()
                            .aspectRatio(contentMode: .fill) // Fill the frame
                            .clipped()                       // Clip overlaping parts
                            .cornerRadius(10)
                            .shadow(radius: 9)
                    }
                    .gesture(
                        TapGesture()
                            .onEnded { _ in
                                self.selectedImage = ""
                                self.selectedImage = self.urlStrings[index]
                                self.showingSingleImageView.toggle()
                    })
                    
                    
                } .padding([.trailing, .leading], 10)
                
            }.padding(.top, -40)
            }
            if showingSingleImageView == true{
                ImageSingleView(selectedImage: self.$selectedImage, show: self.$showingSingleImageView)
            }
        }
        
    }
}



struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView( urlStrings: ["https://image.shutterstock.com/image-illustration/please-wait-loading-waiting-transfer-260nw-393622861.jpg"], title: "Test title", date: "22 Jun", description: "test description")
    }
}


