//
//  testView.swift
//  SaitamanDaily
//
//  Created by beni garcia on 24/03/23.
//

import SwiftUI

struct testView: View {
    @State var gajah1:Bool = false
    @State var gajah2:Bool = false
    @State var gajah3:Bool = false
    
    var body: some View {
        VStack{
            Text("\(gajah1.description) \(gajah2.description) \(gajah3.description)")
            View1(gajah: $gajah1)
            View1(gajah: $gajah2)
            View1(gajah: $gajah3)
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}

struct View1:View{
    @Binding var gajah:Bool
    var body: some View{
        VStack{
            Button("toggle"){
                gajah.toggle()
            }
        }
    }
}
