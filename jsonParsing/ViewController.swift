//
//  ViewController.swift
//  jsonParsing
//
//  Created by Mitosis on 24/02/17.
//  Copyright © 2017 Mitosis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.github.com/users/mralexgray")
        let task = URLSession.shared.dataTask(with: url!) {(data,response,error) in
            if(error != nil)
            {
                print("Error")
            }
        else{
                print("I am in")
                if let content =  data
                {
                    do{
                        print(content)
                        let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                            if let name = jsonResult["name"]
                            {
                            print(name)
                        }
                      
                        
                    }
                    catch{
                        print("Again Error")
                    }
                }
            }
        }
    task.resume()
    }
}


