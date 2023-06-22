import Foundation
import UIKit
import Firebase

struct Products {
    var name: String = ""
    var price: Int = 0
    var about: String = ""
    var weight: Int = 0
    var imageName: String = ""
    var tagProducts: Int = 0
}

public class model{
   
    let nameCoffee = ["Эспрессо","Латте","Капучино","Медовый Раф"]
    let priceCoffee = [100,90,125,100]
    let weightCoffee = [100,100,100,100]
    let aboutCoffee = ["Ничего кроме эспрессо","Треть эспрессо и 2 трети взбитого молока","Треть эспрессо, треть молока и треть взбитого молока","Взбитое молоко, эспрессо и немного медового сиропа"]
    let imageCoffee:[UIImage] = [UIImage(named: "espresso")!,UIImage(named: "latte")!,UIImage(named: "cappusino")!,UIImage(named: "honeyraff")!]
    
    let nameFastfood = ["Сендвич с курицей","Сендвич с лососем","Сендвич утренний"]
    let priceFastfoode = [149,199,99]
    let weightFastfood = [200,200,200]
    let aboutFastfood = ["Курицей, помидором, луком и салатом.","Сыр филадельфия, лосось и салат.","Яйцо, сыр и бекон"]
    let imageFastfood:[UIImage] = [UIImage(named: "chickensend")!,UIImage(named: "fishsend")!,UIImage(named: "eggsend")!]
 
    
    let nameSweat = ["Круассан","Макаруны","Чизкейк","Эклер"]
    let priceSweat = [49,149,125,90]
    let weightSweat = [100,100,100,100]
    let aboutSweat = ["Круассан с миндальным кремом и посыпкой миндаля","Макаруны с 4 вкусами, апельсин, малина, фисташка, черника","Нежный чизкейк с клубникой","Эклер с ванильным кремом"]
    let imageSweat:[UIImage] = [UIImage(named: "kruas")!,UIImage(named: "maccaruni")!,UIImage(named: "cheez")!,UIImage(named: "ekler")!]
 
    
    let nameSoup = ["Борщ","Сырный суп","Щи","Солянка"]
    let priceSoup = [149,129,149,99]
    let weightSoup = [350,350,350,350]
    let aboutSoup = ["Это Борщ"," Это Сырный суп","Это ЩИ","Это Солянка"]
    let imageSoup:[UIImage] = [UIImage(named: "borch")!,UIImage(named: "cheess")!,UIImage(named: "shi")!,UIImage(named: "saltsoup")!]
 
    
    public var numSelect: Int = 100

    func createProduct(tagCollection:Int, tagProduct: Int) -> Array<String>{
        var productArray: [String] = []
        switch tagCollection {
        case 1:
            productArray.append(nameCoffee[tagProduct])
            productArray.append(String(priceCoffee[tagProduct]))
            productArray.append(String(weightCoffee[tagProduct]))
            productArray.append(aboutCoffee[tagProduct])
            
        case 2:
            productArray.append(nameFastfood[tagProduct])
            productArray.append(String(priceFastfoode[tagProduct]))
            productArray.append(String(weightFastfood[tagProduct]))
            productArray.append(aboutFastfood[tagProduct])
        case 3:
            productArray.append(nameSweat[tagProduct])
            productArray.append(String(priceSweat[tagProduct]))
            productArray.append(String(weightSweat[tagProduct]))
            productArray.append(aboutSweat[tagProduct])
            
        case 4:
            productArray.append(nameSoup[tagProduct])
            productArray.append(String(priceSoup[tagProduct]))
            productArray.append(String(weightSoup[tagProduct]))
            productArray.append(aboutSoup[tagProduct])
        default:
            print("errorModel")
        }
        return productArray
    }
   
    func createNameArrOrde(tagCollection: [Int], tagProduct: [Int]) -> Array<String>{
        var resNameArr: [String] = []
        var items: Int = 0
        if tagCollection.count > 0{
            for i in 0...tagCollection.count - 1{
                items = tagCollection[i]
                switch items {
                case 1:
                    resNameArr.append(nameCoffee[tagProduct[i]])
                case 2:
                    resNameArr.append(nameFastfood[tagProduct[i]])
                case 3:
                    resNameArr.append(nameSweat[tagProduct[i]])
                case 4:
                    resNameArr.append(nameSoup[tagProduct[i]])
                default:
                    print("errorCollectionNameModel")
                }
            }
        }
        return resNameArr
    }
    
    func createPriceArrOrde(tagCollection: [Int], tagProduct: [Int]) -> Array<Int>{
        var resPriceArr: [Int] = []
        var items: Int = 0
        if tagCollection.count > 0{
            for i in 0...tagCollection.count - 1{
                items = tagCollection[i]
                switch items {
                case 1:
                    resPriceArr.append(priceCoffee[tagProduct[i]])
                case 2:
                    resPriceArr.append(priceFastfoode[tagProduct[i]])
                case 3:
                    resPriceArr.append(priceSweat[tagProduct[i]])
                case 4:
                    resPriceArr.append(priceSoup[tagProduct[i]])
                default:
                    print("errorCollectionPriceModel")
                }
            }
        }
        return resPriceArr
    }
    
    func createImageArrOrde(tagCollection: [Int], tagProduct: [Int]) -> Array<UIImage>{
        var resImageArr: [UIImage] = []
        var items: Int = 0
        if tagCollection.count > 0{
            for i in 0...tagCollection.count - 1{
                items = tagCollection[i]
                switch items {
                case 1:
                    resImageArr.append(imageCoffee[tagProduct[i]])
                case 2:
                    resImageArr.append(imageFastfood[tagProduct[i]])
                case 3:
                    resImageArr.append(imageSweat[tagProduct[i]])
                case 4:
                    resImageArr.append(imageSoup[tagProduct[i]])
                default:
                    print("errorCollectionImageModel")
                }
            }
        }
        return resImageArr
    }
    
    func summOrder(priceArr:[Int], countArr: [Int]) -> Int{
        var sum: Int = 0
        if countArr.count > 0{
            for i  in 0...countArr.count - 1{
                sum += priceArr[i] * countArr[i]
            }
        }
        return sum
    }
    
    func checkLogIn(nicknameArr:[String], passwordArr:[String], nick: String, pass: String) -> Int{
        var state: Int = 0
        for i in 0...nicknameArr.count - 1{
            if nick == nicknameArr[i]{
                state = 1
                break
            }else{
                state = 0
            }
        }
        if state == 1{
            for j in 0...passwordArr.count - 1{
                if pass == passwordArr[j] {
                    state = 2
                    break
                }else{
                    state = 0
                }
            }
        }
        return state
    }
    
    func takeTagOfUser(idArr:[String], id: String) -> Int{
        var resTag: Int = -2
        if idArr.count > 0{
            for i in 0...idArr.count - 1{
                if id == idArr[i]{
                    resTag = i
                    break
                }
            }
        }
        return resTag
    }
    
    func takeConversion(sum: Int) -> Int{
        if sum >= 10000{
            return 15
        }else{
            return 5
        }
    }
    
    func converionFunc(id: String) -> String{
        var conv: String = ""
        var summ: Int = 0
        
        let placeRef = Database.database().reference().child("users").child(id)
        
        placeRef.observeSingleEvent(of: .value) { (snapshot) in
            let idd = snapshot.value as! [String: Any]
            summ = idd["summOfOrder"] as! Int
        }
        conv = String(takeConversion(sum: summ))
        return conv
    }
}
