//
//  ContentView.swift
//  SaitamanDaily
//
//  Created by beni garcia on 21/03/23.
//

import SwiftUI

enum DisplayedScreen{
    case home
    case quest
}

struct ContentView: View {
    @State var cCoin = 5000
    @State var currentDisplay: DisplayedScreen = .home
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text("C")
                    .padding(8)
                    .background(.gray)
                    .cornerRadius(50)
                
                Text(String(cCoin))
            }
            .padding()
            .background(.yellow)
            Spacer()
            switch currentDisplay {
            case .home:
                HomeView(currentDisplay: $currentDisplay,cCoin:$cCoin)
            case .quest:
                QuestView()
            }
            Spacer()
        }
        .padding(.top,4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
