//
//  ContentView.swift
//  iis
//
//  Created by ShengJung on 2020/1/15.
//  Copyright © 2020 thinkingsoftware. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var menuOpen: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if !self.menuOpen {
                    Button(action: {
                        self.openMenu()
                    }, label: {
                        Text("Open")
                    })
                }
    
                SideMenu(width: 250,
                         isOpen: self.menuOpen,
                         menuClose: self.openMenu)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())

    }
    
    func openMenu() {
        self.menuOpen.toggle()
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
