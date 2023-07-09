//
//  CalmPaywallView.swift
//  swiftui-paywalls
//
//  Created by Alper Sülün on 8.07.2023.
//

import SwiftUI

struct CalmPaywallView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                Color(hex: 0xFF0F6593),
                Color(hex: 0xFF234D8B),
                Color(hex: 0xFF2A317C)
            ]),
                           startPoint: .top,
                           endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack (alignment:.leading){
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(hex: 0xFF184276))
                            .font(.largeTitle)
                        Spacer()
                    }
                }
                Spacer()
                Text("Your Plan is ready.").font(.largeTitle).padding(.bottom,2)
                HStack {
                    Text("Unlock")
                        .font(.largeTitle)
                        .underline() +
                    Text(" Calm")
                        .font(.italic(.largeTitle)())
                        .bold()
                        .underline()
                    
                }.padding(.bottom, 0)
                
                VStack(alignment:.leading){
                    OfferRow(title: "7 Day Free Trial") .background(Color(hex: 0xFF718EB0)).bold()
                        .cornerRadius(24)
                    OfferRow(title: "An original Daily Calm every day")
                    OfferRow(title: "100+ guided meditations on anxiety, stress, sleep and more")
                    OfferRow(title: "Entire library of Sleep Stories, with new stories added every week")
                    OfferRow(title: "Exclusive music for sleep and relaxation")
                    OfferRow(title: "Life-changing Calm Masterclasses taught by world-reowned experts")
                    
                }
                Spacer()
                VStack(alignment:.leading){
                    Text("Try 7 days free, then $69.99/year.")
                    Text("Cancel anytime")
                }.bold().padding(.bottom,16)
                
                Button(action: {
                    // Button action
                }) {
                    Text("Try Free & Subscribe")
                        .foregroundColor(.black)
                        .bold()
                        .padding(.vertical,24)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(32)
                }
            }.padding()
        } .navigationBarBackButtonHidden(true).foregroundColor(.white)
    }
}

struct CalmPaywallView_Previews: PreviewProvider {
    static var previews: some View {
        CalmPaywallView()
    }
}


extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

struct OfferRow: View {
    let title: String
    var body: some View {
        HStack {
            
            Image(systemName: "checkmark.circle.fill")
            Text(title)
            
        } .padding(.top, 8)
            .padding(.bottom, 8)
            .padding(.leading,8)
            .padding(.trailing,8)
        
        
        
    }
}
