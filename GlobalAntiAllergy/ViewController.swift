//
//  ViewController.swift
//  GlobalAntiAllergy
//
//  Created by uics15 on 10/28/17.
//  Copyright © 2017 uics15. All rights reserved.
//

import UIKit

struct ProductScanned{
    let product_name_en:String
    let image_front_small_url:String
    let ingredients_text_with_allergens_en: String
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let jsonUrlString = "https://world.openfoodfacts.org/api/v0/product/737628064502.json"
        guard let url = URL(string:jsonUrlString) else
        {return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            //let dataasString = String(data: data, encoding:.utf8)
            //print (dataasString)
            do {
                let json = try JSONSerialization.jsonObject(with:data, options:.mutableContainers)
            print (json)
            } catch let jsonErr {
                print ("error serializinf json:", jsonErr)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

