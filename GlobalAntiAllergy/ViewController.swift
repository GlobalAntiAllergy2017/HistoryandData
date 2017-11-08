//
//  ViewController.swift
//  GlobalAntiAllergy
//
//  Created by yunfjiang on 10/28/17.
//  Copyright © 2017 yunfjiang. All rights reserved.
//

import UIKit

struct webdescription: Decodable{
    let code : String
    let product : ProductScanned
}
struct ProductScanned: Decodable{
    
    let product_name_en:String
    let image_front_small_url:String
    let ingredients_text_with_allergens_en: String
    
//    init(json: [String: Any] ){
//        product_name_en = json["code"] as? String ?? ""
//        //product_name_en = json["product"] ["product_name_en"] as! String
//        image_front_small_url = json["image_front_small_url"] as? String ?? ""
//        ingredients_text_with_allergens_en = json["ingredients_text_with_allergens_en"] as? String ?? ""
//
//    }

}
class ViewController: UIViewController {
    let codescanned: String = ""

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
                let webDescription = try JSONDecoder().decode(webdescription.self, from: data)
 //               let json = try JSONSerialization.jsonObject(with:data, options:.mutableContainers)
                print (webDescription.product.product_name_en)
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

