//
//  ContentView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 04/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI
import URLImage


struct ActivityListView: View {
    
    @State private var activityTitle = ""
    @State private var activityDescription = ""
    @State private var showingAlert = false
    
    @ObservedObject var activites = ActivitesStore()
    
    
    init() {
        UITableView.appearance().separatorColor = .clear //removes line separtors in list
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(named: "LBPurple") ?? Color.purple] //changing the color of the navigation bar title
    }
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(0..<self.activites.activites.count, id: \.self) {index in
                    ZStack (alignment: .leading){
                        URLImage(URL(string: self.activites.activites[index].imageURLs[0])!) { proxy in
                            proxy.image
                                .resizable()
                                .clipped()                       // Clip overlaping parts
                        }
                      
                            Text(self.activites.activites[index].title)
                            .font(.custom("Lato-Bold.ttf", size: 22))
                            .foregroundColor(.white)
                            .offset(x: 10, y: 45)
                        Text(self.activites.activites[index].dateString.prefix(6))
                            .font(.custom("Lato-Bold.ttf", size: 18))
                            .foregroundColor(.white)
                            .offset(x: 275, y: 45)
                    
                        
                        NavigationLink(destination: ActivityDetailView(urlStrings: self.activites.activites[index].imageURLs, title: self.activites.activites[index].title, date: self.activites.activites[index].dateString, description: self.activites.activites[index].description)){
                            EmptyView() // in order to hide the arrow on the list we need to add empty view see medium article below for more details
                        }
                        
                    }.frame(height: 160)
                }
                .cornerRadius(10)
                .shadow(radius: 8)
            }
            .modifier(CustomNavigationBarViewModifier(sectionTitle: "Gallery"))
                .environment(\.defaultMinListRowHeight, 180) // creates spacing between the  rows for better UI.
        }
    }
}



//MARK: CUSTOM NAVIGATION BAR
struct CustomNavigationBarViewModifier: ViewModifier {
    
    var sectionTitle: String
    
    func body(content: Content) -> some View {
        return content
            .navigationBarTitle(Text(sectionTitle))
            .navigationBarItems(leading:
                VStack(alignment: .leading, spacing: 10){
                    Text("Little Buds")
                        .modifier(CustomTextStyle())
                    
            })
        
    }
    
    struct CustomTitleStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.custom("Capriola-Regular.ttf", size: 34))
                .foregroundColor(Color("LBPurple"))
        }
    }
    
    struct CustomTextStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.custom("Capriola-Regular.ttf", size: 13))
                .foregroundColor(.orange)
        }
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityListView().environmentObject(ActivitesStore())
    }
}



//How to hide arrow on a list swiftUI
//www.medium.com/@nateteahan/swiftui-getting-rid-of-the-navigationlink-disclosure-arrow-c77fd3d8bc17




