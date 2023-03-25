//
//  QuestView.swift
//  SaitamanDaily
//
//  Created by beni garcia on 21/03/23.
//

import SwiftUI

struct QuestView: View {
    @Binding var cCoin:Int
    @State private var quest1 = false
    @State private var quest2 = false
    @State private var quest3 = false
    @State private var quest4 = false
    @State var second = 59
    @State var minute = 59
    @State var hour = 23
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Quest").font(.largeTitle)
            Divider()
            VStack {
                
                VStack(alignment: .leading){
                    HStack{
                        Toggle(isOn : $quest1){}
                        .toggleStyle(iOSCheckboxToggleStyle(cCoin: $cCoin))
                        .foregroundColor(.black)
                        
                        
                        
                        VStack(alignment: .leading) {
                            Text("Push up 100x")
                                .font(.largeTitle)
                            
                            HStack {
                                Text("C")
                                    .padding(7)
                                    .background(.gray)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    HStack {
                        Toggle(isOn : $quest2){}
                        .toggleStyle(iOSCheckboxToggleStyle(cCoin: $cCoin))
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("Sit up 100x")
                                .font(.largeTitle)
                            
                            HStack {
                                Text("C")
                                    .padding(7)
                                    .background(.gray)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    
                    HStack {
                        Toggle(isOn : $quest3){}
                        .toggleStyle(iOSCheckboxToggleStyle(cCoin: $cCoin))
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("Squat 100x")
                                .font(.largeTitle)
                            HStack {
                                Text("C")
                                    .padding(7)
                                    .background(.gray)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    HStack {
                        Toggle(isOn : $quest4){}
                        .toggleStyle(iOSCheckboxToggleStyle(cCoin: $cCoin))
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("Run 10km")
                                .font(.largeTitle)
                            HStack {
                                Text("C")
                                    .padding(7)
                                    .background(.gray)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(25)
                .background(.yellow)
                .cornerRadius(30)
                
                Text("\(hour) : \(minute) : \(second)")
                    .onReceive(timer) { _ in
                        
                        if second > 0 {
                            second -= 1
                        } else {
                            second = 60
                            if minute > 0 {
                                minute -= 1
                            } else {
                                minute = 59
                                if hour > 0{
                                    hour -= 1
                                } else {
                                    hour = 23
                                    quest1 = false
                                    quest2 = false
                                    quest3 = false
                                    quest4 = false
                                    
                                }
                            }
                            
                        }
                }
                    .font(.title2)
                Spacer()
            }
        }
        .padding()
    }
}

struct QuestView_Previews: PreviewProvider {
    @State static var cCoin = 0
    static var previews: some View {
        QuestView(cCoin:$cCoin)
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    @Binding var cCoin:Int
    func makeBody(configuration: Configuration) -> some View {
        // 1
        
        Button(action: {

            // 2
            configuration.isOn = true
            cCoin += 20
        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
        
    }
}
