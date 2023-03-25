//
//  HomeView.swift
//  SaitamanDaily
//
//  Created by beni garcia on 21/03/23.
//

import SwiftUI



struct HomeView: View {
    @Binding var currentDisplay:DisplayedScreen
    @Binding var cCoin:Int
    @State var displayAvatar = "skin1"
    @State var currImg:String = ""
    @State var ownSkin = false
    @State var currIdx = 0
    @State var avatars:[AvatarModel] = [
        AvatarModel(displayAvatar: "skin1", unlock: true, price: 0),
        AvatarModel(displayAvatar: "skin2", unlock: false, price: 25),
        AvatarModel(displayAvatar: "skin3", unlock: false, price: 50),
        AvatarModel(displayAvatar: "skin4", unlock: false, price: 75),
        AvatarModel(displayAvatar: "skin5", unlock: false, price: 100)
    ]
    @State var isModalPresented = false
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
            ForEach(Array(avatars.enumerated()),id:\.1) { index,avatar in
                ZStack{
                    if !avatar.unlock {
                    Button(action: {
                        currIdx=index
                        currImg = avatar.displayAvatar
                        self.isModalPresented = true
                    }) {
                        Image(avatar.displayAvatar)
                            .resizable()
                            .frame(width: 23, height: 53)
                    }
                    .sheet(isPresented: $isModalPresented) {
                        CustomPopupView(isPresented: self.$isModalPresented,cCoin: $cCoin,avatars:$avatars,currIdx:$currIdx)
                    }
                        Image(systemName: "lock.fill")
                            .resizable().frame(width: 23,height: 30)
                        
                    }else if avatar.unlock{
                        Button(action: {
                            displayAvatar=avatar.displayAvatar
                        }) {
                            Image(avatar.displayAvatar)
                                .resizable()
                                .frame(width: 23, height: 53)
                        }
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
                .padding(.horizontal,5)
                if index==1{
                    
                }
            }
            
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
    @State static var cCoin:Int = 0
    static var previews: some View {
        HomeView(currentDisplay: $currentDisplay, cCoin: $cCoin)
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


struct CustomPopupView: View {
    @Binding var isPresented: Bool
    @Binding var cCoin:Int
    @Binding var avatars:[AvatarModel]
    @Binding var currIdx:Int
    var body: some View {
        VStack {
            Text("Buy this skin?")
            Image(avatars[currIdx].displayAvatar)
            HStack{
                Text("C")
                    .padding(8)
                    .background(.gray)
                    .cornerRadius(50)
                Text(String(avatars[currIdx].price))
            }
            HStack{
                Button("Buy") {
                    cCoin -= avatars[currIdx].price
                    avatars[currIdx].unlock.toggle()
                    self.isPresented = false
                }
                .padding()
                .background(.green)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal,5)
                Button("Close") {
                    self.isPresented = false
                }
                .padding()
                .background(.red)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal,5)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: 300, height: UIScreen.main.bounds.height * 0.25)
    }
}
