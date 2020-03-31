//
//  DBconnector.swift
//  iis
//
//  Created by 楊昇融 on 2020/2/4.
//  Copyright © 2020 thinkingsoftware. All rights reserved.
//

import Foundation
import UIKit

public class DBconnect{

     public static func executeQuery(query_string: String) -> String {
        
        let postString = "query_string=\(query_string)"
        let url = URL(string: "https://reportor.mobileit.tw/DBconnector/DBconnector.php")!
        
        var request = URLRequest(url: url)
        var checkstr = ""
        var result :String = ""
        
        request.httpMethod = "POST"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
            }
        
             result = String(data: data, encoding: .utf8)!
           
             checkstr="true"
        }
        task.resume()
        
        while(checkstr==""){
        }
        
        return result
    }
}

