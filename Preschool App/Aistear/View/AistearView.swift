//
//  AistearView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 15/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI

struct AistearView: View {
    
    @EnvironmentObject var session: SessionStore
    
    @State private var showAlert = true
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                            .lineLimit(9)
                            .foregroundColor(Color("veryLightGrey"))
                            .shadow(radius: 8)
                            .frame(minWidth: 350, maxWidth: .infinity, minHeight: 100, maxHeight: 170)
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("\(AistearStore.introductionToAistear)")
                                .font(.custom("Lato-Regular.ttf", size: 14))
                            
                        }.padding(8)
                        
                    }.padding([.trailing, .leading], 10)
                    
                    AistearCellsFourConceptsView().padding(.top, 30)
                    
                    Button("Sign Out"){
                        self.session.signOut()
                    }.padding(.top, 50)
                }
                
                if self.session.session?.newUser == true {
                    
                    Button(""){
                    }.alert(isPresented: self.$showAlert) {
                        //Alert(title: Text("Account Created"), dismissButton: .default(Text("OK")))
                        Alert(title: Text(""), message: Text("Welcome to the Little Buds App \u{1F603}"), dismissButton: .default(Text("OK")))
                    }
                }
                
            }.modifier(CustomNavigationBarViewModifier(sectionTitle: "Aistear"))
        }
    }
    
}






struct CustomAistearCellViewModifier: ViewModifier {
    
    var backgroundColor : Color
    
    func body(content: Content) -> some View {
        return content
            .frame(width: 160, height: 150)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 8)
    }
}

//struct AistearView_Previews: PreviewProvider {
//    static var previews: some View {
//        AistearView(, showingAccountCreatedAlert: <#Binding<Bool>#>)
//    }
//}

