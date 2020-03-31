//
//  MenuContent.swift
//  iis
//
//  Created by 楊昇融 on 2020/1/21.
//  Copyright © 2020 thinkingsoftware. All rights reserved.
//

import SwiftUI

struct MenuContent: View {
    var body: some View {
        List {
            NavigationLink("新增客戶", destination: NewClient())
            
            NavigationLink("新增客戶", destination: NewClient())
            
            NavigationLink("新增客戶", destination: NewClient())
            
            Text("新增客戶").onTapGesture {
                print("New Client")
                
            }
            
            Text("瀏覽客戶").onTapGesture {
            }
        }
    }
}


