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
    
    let product_name:String?
    let image_front_small_url:String?
    let ingredients_text_with_allergens: String?
    let image_url:String?
    let additives:String?
    let countries:String?
    let allergens:String?
    let brands:String?
    
    
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
        let jsonUrlString = "https://world.openfoodfacts.org/api/v0/product/3396411224584.json"
        guard let url = URL(string:jsonUrlString) else
        {return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            //let dataasString = String(data: data, encoding:.utf8)
            //print (dataasString)
            do {
                let webDescription = try JSONDecoder().decode(webdescription.self, from: data)
                let json = try JSONSerialization.jsonObject(with:data, options:.mutableContainers)
                //print(json)
                print (webDescription.product.product_name!)
                print(webDescription.product.countries!)
                print(webDescription.product.image_front_small_url!)
                print(webDescription.product.ingredients_text_with_allergens)
                //print(webDescription.product.additives)
            } catch let jsonErr {
                print ("error serializinf json:", jsonErr)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func booleansearchallergent( ingredients: String, allergent: String, language: String) -> Bool{
        let ingredientArr = ingredients.components(separatedBy: [":", ",", " "])
        let keyword: [String] = translate(allergent: allergent, Languagename: language)
        for (Stringx) in ingredientArr{
            for (Stringy) in keyword{
                if (Stringx == Stringy){
                    return true
                }
                
            }
        }
        return false
    }
    
    func translate(allergent: String, Languagename: String) -> [String]{
        if (Languagename == "french")&&(allergent == "peanut"){
            return ["",""]
            
        }
        else if (Languagename == "French") && (allergent == "diary"){
            return ["",""]
        }
        else if (Languagename == "German") && (allergent == "peanut"){
            return ["",""]
        }
        else if (Languagename == "German") && (allergent == "diary"){
            return["",""]
        }
        return [""]
    }
    
    func setPicUrl(urlinput:String){
        if let url = NSURL(string:urlinput){
            if let imageData = NSData(contentsOf: url as URL) {
                let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
                let data: NSData = NSData(base64Encoded: str64 , options: .ignoreUnknownCharacters)!
                let dataImage = UIImage(data: data as Data)
                
            }
        }
    }


}

