//
//  gpt.swift
//  swiftui-paywalls
//
//  Created by Alper Sülün on 8.07.2023.
//

import SwiftUI
struct ChatGPTPaywallView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showSubsAlert = false
    @State private var alertSubsTitle = ""
    @State private var alertSubsDescription = ""
    @State private var localPrice = "$6.99"
    @State private var showProgressIndicator = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("ChatGPT Plus")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            VStack(alignment:.leading){
                PremiumRowView(icon: "bolt.fill",color: .yellow, title: "Premium features", description: "Plus subscribers have access to GPT-4 and our latest beta features.")
                PremiumRowView(icon: "flame.fill",color:.orange, title: "Priority access", description: "You'll be able to use ChatGPT even demand is high.")
                PremiumRowView(icon: "hare.fill",color:.pink, title: "Ultra-fast", description: "Enjoy even faster response speeds when using GPT-3.5.")
            }
            Spacer()
            Text("Auto-renews for \(localPrice)/month until canceled").font(.system(size:14)).foregroundColor(.gray)
            Button(action: {
                subscribe()
            }) {
                if showProgressIndicator {
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                } else {
                    Text("Subscribe").foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                }
            }
            
            Spacer()
        }.alert(isPresented: $showSubsAlert) {
            Alert(title: Text(alertSubsTitle),
                  message: Text(alertSubsDescription),
                  dismissButton: .cancel()
            )
        } .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle").foregroundColor(.gray)
                //   .imageScale(.large)
            }))
    }
    func subscribe() {
        showProgressIndicator = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showProgressIndicator = false // Hide progress
            // success
            print("✅ PURCHASE SUCCESSFUL")
            alertSubsTitle = "✅ PURCHASE SUCCESSFUL"
            alertSubsDescription = "You are now subscribed"
            showSubsAlert.toggle()
        }
    }
}

struct SubscriptionViewSheet_Previews: PreviewProvider {
    static var previews: some View {
        ChatGPTPaywallView()
    }
}


struct PremiumRowView: View {
    var icon: String
    var color: Color
    var title: String
    var description: String
    var body: some View {
        HStack(alignment:.top,spacing:32){
            Image(systemName: icon).font(.title).foregroundColor(color).frame(width:24)
            
            VStack(alignment:.leading){
                Text(title).font(.title2).bold()
                Text(description).foregroundColor(.gray)
            }
        }.padding(.vertical,8).padding(.horizontal,16)
        
    }
}
