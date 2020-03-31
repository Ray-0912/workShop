//
//  model.swift
//  iis
//
//  Created by 楊昇融 on 2020/2/24.
//  Copyright © 2020 thinkingsoftware. All rights reserved.
//

import Foundation


class clientDetail {
    var id = 0
    var name = ""
    var addr = ""
    var other = ""
    
    
    //todo sql server add
    func clientAdd() {
        let sqlQuery = "INSERT INTO Client(Name, Addr, Other) VALUES('\(self.name)', '\(self.addr)', '\(self.other)')"
        print(sqlQuery)
//        let result = DBconnect.executeQuery(query_string: sqlQuery)
//        
//        let returnData = result.data(using: String.Encoding.utf8)
//        var returnArr : NSArray = []
//        
//        do {
//            returnArr = try JSONSerialization.jsonObject(with: returnData!, options: []) as! NSArray
//        } catch let error as NSError { print(error) }
//        
//        if let tmp = (returnArr[0] as! NSDictionary)["id"] as? Int {
//            self.id = tmp
//        } else { print("clientDetail id cannot get things.") }
    }
    
    //todo sql server delete
    
    //todo sql server update
    
    //todo sql server search
    func clientSearch(id : Int) {
        let sqlQuery = "SELECT * FROM Client WHERE id = '\(id)'"
        let result = DBconnect.executeQuery(query_string: sqlQuery)
        
        let returnData = result.data(using: String.Encoding.utf8)
        var returnArr : NSArray = []
        
        do {
            returnArr = try JSONSerialization.jsonObject(with: returnData!, options: []) as! NSArray
        } catch let error as NSError { print(error) }
        
        if let tmp = (returnArr[0] as! NSDictionary)["id"] as? Int {
            self.id = tmp
        } else { print("clientDetail id cannot get things.") }
    }
    
    //todo coredata?
}
