//
//  SignUpView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 18/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State var childName: String = ""
    @State var parentName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @State var code: String = ""
    @ObservedObject private var keyboard = KeyboardResponder()
    @EnvironmentObject var session: SessionStore
    
    var classCode : Int = 123
    
    func signUp() {
        
        if self.parentName != "" {
            if Int(code) == classCode{
                session.signUp(email: email, password: password, parent: parentName, child: childName) { (result, error) in
                    if let error = error {
                        self.error = error.localizedDescription
                    } else {
                        self.email = ""
                        self.password = ""
                    }
                }
            }
            else {
                error = "The class code is incorrect please contact the preschool teacher"
            }
        }else {
            error = "Parents Name is missing"
        }
    }
    
    
    var body: some View {
        NavigationView{
            VStack {
                if keyboard.currentHeight == 0 {
                    Image("Little Buds logo")
                }
                VStack(spacing: 4) {
                    TextField("Child Name", text: $childName)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))
                    
                    TextField("Parent Name", text: $parentName)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))
                    
                    TextField("Email address", text: $email)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))
                    
                    SecureField("Password", text: $password)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))
                    
                    TextField("Class Code", text: $code)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("bg1"), lineWidth: 1))
                    
                }.padding(.bottom, keyboard.currentHeight - 19)
                
                    Button(action: signUp) {
                        Text("Create Account")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 45)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .background(LinearGradient(gradient: Gradient(colors: [Color("LBPurple"), Color("LBPurple")]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(5)
                        
                    }.padding(.top, 14)
                    
                    Spacer()
                
                    NavigationLink(destination: SignInView()) {
                        HStack {
                            Text("I already have an account")
                                .font(.system(size: 14, weight: .light))
                                .foregroundColor(.primary)
                            
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color("bg2"))
                        }
                    }
                    if (error != "") {
                        Text(error)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.red)
                            .padding()
                    }
                    Spacer()
            }
            .modifier(CustomNavigationBarViewModifier(sectionTitle: "Create Account"))
            .padding(.horizontal, 32)
        }
    }
}



struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

