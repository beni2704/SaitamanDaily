//
//  HomeView.swift
//  SaitamanDaily
//
//  Created by beni garcia on 21/03/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var currentDisplay:DisplayedScreen
    @State var displayAvatar = "skin1"
    @State private var showTutorial = false
    var body: some View{
        HStack{
            Spacer()
            VStack{
                Image("quest")
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                Image("camera")
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                Button(action: {
                    showTutorial=true
                }) {
                    Image("tutorial")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                }
                .sheet(isPresented: $showTutorial) {
                    ModalView()
                }
                Spacer()
            }
            .padding(.horizontal,8)
            Image("bubble-saitama")
                .resizable()
        }
        .padding(.top,10)
        Image(displayAvatar)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 400)
        HStack{
            HStack{
                Button(action: {
                    displayAvatar="skin1"
                }) {
                    Image("skin1")
                        .resizable()
                        .frame(width: 23, height: 53)
                }
            }
            .padding(12)
            .background(.white)
            .border(.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black)
            )
            HStack{
                Button(action: {
                    displayAvatar="skin2"
                }) {
                    Image("skin2")
                        .resizable()
                        .frame(width: 23, height: 53)
                }
            }
            .padding(12)
            .background(.white)
            .border(.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black)
            )
            .padding(.leading)
            HStack{
                Button(action: {
                    displayAvatar="skin3"
                }) {
                    Image("skin3")
                        .resizable()
                        .frame(width: 23, height: 53)
                }
            }
            .padding(12)
            .background(.white)
            .border(.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black)
            )
            .padding(.leading)
            HStack{
                Button(action: {
                    displayAvatar="skin4"
                }) {
                    Image("skin4")
                        .resizable()
                        .frame(width: 23, height: 53)
                }
            }
            .padding(12)
            .background(.white)
            .border(.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black)
            )
            .padding(.leading)
            HStack{
                Button(action: {
                    displayAvatar="skin5"
                }) {
                    Image("skin5")
                        .resizable()
                        .frame(width: 23, height: 53)
                }
            }
            .padding(12)
            .background(.white)
            .border(.black)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black)
            )
            .padding(.leading)
        }
        .padding()
        .background(.yellow)
        .border(.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black)
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    @State static var currentDisplay: DisplayedScreen = .home
    static var previews: some View {
        HomeView(currentDisplay: $currentDisplay)
    }
}

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a tutorial.")
            Button("Understand") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
