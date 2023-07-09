//
//  ContentView.swift
//  swiftui-paywalls
//
//  Created by Alper Sülün on 8.07.2023.
//

import SwiftUI


struct ContentView: View {
    @State private var showDetailView = false
    @State private var selectedView: AnyView?
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ChatGPTPaywallView()) {
                    Text("ChatGPT Paywall")
                    //CalmPaywallView
                }
                NavigationLink(destination: CalmPaywallView()) {
                    Text("Calm Paywall")
                    //CalmPaywallView
                }
            }
            .navigationBarTitle("Paywalls")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(0)
            .background(configuration.isPressed ? Color.gray.opacity(0.5) : Color.clear)
    }
}
