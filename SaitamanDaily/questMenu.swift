//
//  ContentView.swift
//  Saitama100
//
//  Created by Felix Natanael on 20/03/23.
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-use-a-timer-with-swiftui

import SwiftUI


struct questMenu: View {
    @State private var quest1:Bool = false
    @State private var quest2 = false
    @State private var quest3 = false
    @State private var quest4 = false
    @State var second = 60
    @State var minute = 59
    @State var hour = 23
       let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //ar toDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    
    
    var body: some View {
        VStack {
            
        
            Text("Quest").font(.largeTitle)
            Divider()
            VStack {
                
                VStack  {
                    HStack {
                        Toggle(isOn : $quest1){}
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("quest 1")
                                .font(.largeTitle)
                            
                            HStack {
                                Text("XP")
                                    .foregroundColor(.white)
                                    .padding(7)
                                    .background(.blue)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    HStack {
                        Toggle(isOn : $quest2){}
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("quest 2")
                                .font(.largeTitle)
                            
                            HStack {
                                Text("XP")
                                    .foregroundColor(.white)
                                    .padding(7)
                                    .background(.blue)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    
                    HStack {
                        Toggle(isOn : $quest3){}
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("quest 3")
                                .font(.largeTitle)
                            HStack {
                                Text("XP")
                                    .foregroundColor(.white)
                                    .padding(7)
                                    .background(.blue)
                                .cornerRadius(100)
                                
                                Text("20")
                                    .font(.title)
                            }
                        }
                    }
                    
                    HStack {
                        Toggle(isOn : $quest4){}
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundColor(.black)
                        
                        
                        VStack(alignment: .leading) {
                            Text("quest 4")
                                .font(.largeTitle)
                            HStack {
                                Text("XP")
                                    .foregroundColor(.white)
                                    .padding(7)
                                    .background(.blue)
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
                        
                            second -= 1
                            if second == 0 {
                                minute -= 1
                                second = 60
                                if minute == 0{
                                    hour -= 1
                                    minute = 59
                                    if hour == 0 {
                                        hour = 23
                                    }
                                }
                            }
                            
                            
                }
                /*
                Text("Countdown")
                Spacer().frame(height:50)
                TimerView(setDate: toDate)
                */
                
//                HStack {
//                    Toggle(isOn : $isOn){}
//                    .toggleStyle(iOSCheckboxToggleStyle())
//                    .foregroundColor(.black)
//                    Text("quest 1")
//                }
            }
            
            
        }
        .padding()
    }
}

struct questMenuPreviews: PreviewProvider {
    static var previews: some View {
        questMenu()
    }
}

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            
            configuration.isOn = true

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                //Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
        
    }
}
