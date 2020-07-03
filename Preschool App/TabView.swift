//
//  TabView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 15/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI

struct TabView1: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Group {
            if (session.session != nil) {
                TabView{
                    AistearView()
                        .tabItem {
                            Image("information-1")
                                .foregroundColor(.black)
                            Text(verbatim: "Aistear")
                    }
                    ActivityListView()
                        .tabItem {
                            Image("gallery")
                            Text(verbatim: "Gallery")
                    }
                }
            }else {
                SignUpView()
            }
        }.onAppear(perform: getUser)
    }
    
    func getUser() {
        session.listen()
    }
}
