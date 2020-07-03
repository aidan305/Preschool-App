//
//  AistearCellFourConceptsView.swift
//  firebaseGalleryFolders
//
//  Created by aidan egan on 17/06/2020.
//  Copyright © 2020 aidan egan. All rights reserved.
//

import SwiftUI

struct AistearCellsFourConceptsView: View {
    var body: some View {
        
        VStack{
            HStack{
                NavigationLink(destination: GenericAistearConceptView(title: "Exploring & Thinking", description: AistearStore.exploringAndThinking, images: AistearStore.exploringImages, aistearFourAimsView: AistearFourAimsView(color: Color("Aistear - green"), aim1: AistearStore.exploringAndThinkingAims[0], aim2: AistearStore.exploringAndThinkingAims[1], aim3: AistearStore.exploringAndThinkingAims[2], aim4: AistearStore.exploringAndThinkingAims[3], imageTitle: "Exploring"))){
                    VStack(alignment: .leading, spacing: 20){
                        Image("thinking")
                            .foregroundColor(.white)
                        Text("Exploring & \nThinking")
                            .foregroundColor(.white)
                    }.modifier(CustomAistearCellViewModifier(backgroundColor: Color("Aistear - green")))
                }
                Spacer()
                NavigationLink(destination: GenericAistearConceptView(title: "Identity & Belonging", description: AistearStore.identityAndBelonging, images: AistearStore.identityAndBelongingImages, aistearFourAimsView: AistearFourAimsView(color: Color("Aistear - Red"), aim1: AistearStore.identityAndBelongingAims[0], aim2: AistearStore.identityAndBelongingAims[1], aim3: AistearStore.identityAndBelongingAims[2], aim4: AistearStore.identityAndBelongingAims[3], imageTitle: "identityAndBelonging"))){
                    VStack(alignment: .leading, spacing: 20){
                        Image("Identity")
                            .foregroundColor(.white)
                        Text("Identity & \nBelonging")
                            .foregroundColor(.white)
                    }.modifier(CustomAistearCellViewModifier(backgroundColor: Color("Aistear - Red")))
                }
            }.padding([.leading, .trailing])
            
            HStack{
                NavigationLink(destination: GenericAistearConceptView(title: "Communication", description: AistearStore.communication, images: AistearStore.communicationImages, aistearFourAimsView: AistearFourAimsView(color: Color("Aistear - Yellow"), aim1: AistearStore.communicationAims[0], aim2: AistearStore.communicationAims[1], aim3: AistearStore.communicationAims[2], aim4: AistearStore.communicationAims[3], imageTitle: "communication"))){
                    VStack(alignment: .leading, spacing: 20){
                        Image("Communication")
                            .foregroundColor(.white)
                        Text("Communication")
                            .foregroundColor(.white)
                    }
                    .modifier(CustomAistearCellViewModifier(backgroundColor: Color("Aistear - Yellow")))
                }
                Spacer()
                NavigationLink(destination: GenericAistearConceptView(title: "Well", description: AistearStore.wellBeing, images: AistearStore.wellBeingImages, aistearFourAimsView: AistearFourAimsView(color: .purple, aim1: AistearStore.wellbeingAims[0], aim2: AistearStore.wellbeingAims[1], aim3: AistearStore.wellbeingAims[2], aim4: AistearStore.wellbeingAims[3], imageTitle: "wellbeing"))){
                    VStack(alignment: .leading, spacing: 20){
                        Image("Well")
                            .foregroundColor(.white)
                        Text("Well-Being")
                            .foregroundColor(.white)
                    }
                    .modifier(CustomAistearCellViewModifier(backgroundColor: Color("LBPurple")))
                }
            }.padding([.leading, .trailing])
        }
    }
}


struct AistearCellFourConceptsView_Previews: PreviewProvider {
    static var previews: some View {
        AistearCellsFourConceptsView()
    }
}

