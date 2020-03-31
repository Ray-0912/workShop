//
//  NewClient.swift
//  iis
//
//  Created by 楊昇融 on 2020/1/21.
//  Copyright © 2020 thinkingsoftware. All rights reserved.
//

import SwiftUI

var addClient : clientDetail = clientDetail()

struct NewClient: View {
    let textHeader = ["客戶名稱：", "接洽人名稱：", "接洽人單位：", "接洽人手機：", "接洽人名稱：", "客戶地址："]
    
    let placeHolders = ["請輸入客戶名稱", "請輸入接洽人名稱", "請輸入接洽人單位", "請輸入接洽人手機", "請輸入接洽人公司電話", "請輸入客戶地址"]
    
    @State private var clientData = ["", "", "", "", "", ""]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ForEach(0 ..< 6) { item in
                HStack {
                    Text(self.textHeader[item])
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    TextField(self.placeHolders[item], text: self.$clientData[item])
                        .frame(width:200)
                        .tag(item)
                    
                }
                .padding()
            }
            
            Button(action: {
                addClient.name = self.clientData[0]
                addClient.addr = self.clientData[5]
                addClient.clientAdd()
                self.presentationMode.wrappedValue.dismiss()
//                NavigationLink("新增客戶", destination: NewClient())
            }) {
                Text("儲存")
            }
            .padding(.bottom)
            


        }
        .frame(minWidth: 0, maxWidth: .infinity,
               minHeight: 0, maxHeight: .infinity,
               alignment: .center)
        
    }
}


struct NewClient_Previews: PreviewProvider {
    static var previews: some View {
        NewClient()
    }
}
