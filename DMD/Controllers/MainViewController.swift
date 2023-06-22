//
//  MainViewController.swift
//  DMD
//
//  Created by  фф on 27.04.2021.
//

import UIKit
import Firebase

protocol MainViewControllerDelegate: class {
    func update(tagCol: Int, tagPro: Int, countPro: Int)
    func update1(arr:[Int])
}

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MainViewControllerDelegate {
    
    var id:[String] = ["Mx07mtLvGRagF1gDDZqbQw4SjTo1","spaBY6O3cJR6cK3KKG9MhzT2FeJ2"]
    var nickName: [String] = ["busterbrook","shish"]
    var passWord: [String] = ["12345678","2281488"]
    var firstName: [String] = ["Александр", "Михаил"]
    var lastName: [String] = ["Якунин", "Шишлин"]
    var emailArr: [String] = ["sahchez@gmail.com","mishanya@gmail.com"]
    var countBalls: [Int] = [200, 314]
    var sumOfAllOrders: [Int] = [8000,9900]
    var conversion: Int = 0
    
    var tid: String = ""
    
    var numOfOrderItems: Int = 0
    
    var tagProfile: Int = -1
    var tagProduct: Int = 0
    var tagCollection: Int = 0
    
    var tagProArr: [Int] = []
    var tagColArr: [Int] = []
    var countProds: [Int] = []
    
    @IBOutlet var backCollView: UIView!
    @IBOutlet var OneCollView: UICollectionView!
    @IBOutlet var TwoCollView: UICollectionView!
    @IBOutlet var ThreeCollView: UICollectionView!
    @IBOutlet var FourCollView: UICollectionView!
    @IBOutlet var campButton: UIButton!
    @IBOutlet var personalButton: UIButton!
    @IBOutlet var countBasketLabel: UILabel!
    @IBOutlet var backViewCount: UIView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        backCollView.layer.cornerRadius = 15
        campButton.layer.cornerRadius = 28
        backViewCount.layer.cornerRadius = 15
        personalButton.layer.cornerRadius = 28
        
        OneCollView.dataSource = self
        OneCollView.delegate = self
        
        TwoCollView.dataSource = self
        TwoCollView.delegate = self
        
        ThreeCollView.dataSource = self
        ThreeCollView.delegate = self
        
        FourCollView.dataSource = self
        FourCollView.delegate = self
        
        let nibCell1 = UINib(nibName: "FirstCollectionViewCell", bundle: nil)
        OneCollView.register(nibCell1, forCellWithReuseIdentifier: "cell1")
        
        let nibCell2 = UINib(nibName: "SecondCollectionViewCell", bundle: nil)
        TwoCollView.register(nibCell2, forCellWithReuseIdentifier: "cell2")
        
        let nibCell3 = UINib(nibName: "TherdCollectionViewCell", bundle: nil)
        ThreeCollView.register(nibCell3, forCellWithReuseIdentifier: "cell3")
        
        let nibCell4 = UINib(nibName: "FourthCollectionViewCell", bundle: nil)
        FourCollView.register(nibCell4, forCellWithReuseIdentifier: "cell4")
        
        numOfOrderItems = tagColArr.count
        
        countBasketLabel.isHidden = true
        backViewCount.isHidden = true
        
        conversion = Int(model.init().converionFunc(id: tid))!
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == OneCollView{
                return model.init().imageCoffee.count
            }else if collectionView == TwoCollView{
                return model.init().imageFastfood.count
            }else if collectionView == ThreeCollView{
                return model.init().imageSweat.count
            }else if collectionView == FourCollView{
                return model.init().imageSoup.count
            }else{
                return 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == OneCollView{
                let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! FirstCollectionViewCell
                cell1.Cell1NumLabel.text! = model.init().nameCoffee[indexPath.row]
                cell1.priceLabel.text! = String(model.init().priceCoffee[indexPath.row]) + " Р"
                cell1.weightLabel.text! = String(model.init().weightCoffee[indexPath.row]) + " г"
                cell1.imageCoffe.image = model.init().imageCoffee[indexPath.row]
                return cell1
            }else if collectionView == TwoCollView{
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! SecondCollectionViewCell
                cell2.NumLabelCell2.text! = model.init().nameFastfood[indexPath.row]
                cell2.priceLabel.text! = String(model.init().priceFastfoode[indexPath.row]) + " Р"
                cell2.weightLabel.text! = String(model.init().weightFastfood[indexPath.row]) + " г"
                cell2.imageFastfood.image = model.init().imageFastfood[indexPath.row]
                return cell2
            }else if collectionView == ThreeCollView{
                let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! TherdCollectionViewCell
                cell3.cell3NumLabel.text! = model.init().nameSweat[indexPath.row]
                cell3.priceLabel.text! = String(model.init().priceSweat[indexPath.row]) + " Р"
                cell3.weightLabel.text! = String(model.init().weightSweat[indexPath.row]) + " г"
                cell3.image.image = model.init().imageSweat[indexPath.row]
                return cell3
            }else{
                let cell4 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! FourthCollectionViewCell
                cell4.cell4NumLabel.text! = model.init().nameSoup[indexPath.row]
                cell4.priceLabel.text! = String(model.init().priceSoup[indexPath.row]) + " Р"
                cell4.weightLabel.text! = String(model.init().weightSoup[indexPath.row]) + " г"
                cell4.imageSoup.image = model.init().imageSoup[indexPath.row]
                return cell4
            }
        }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tagProduct = indexPath.row
        if collectionView == OneCollView{
            tagCollection = 1
        }else if collectionView == TwoCollView{
            tagCollection = 2
        }else if collectionView == ThreeCollView{
            tagCollection = 3
        }else if collectionView == FourCollView{
            tagCollection = 4
        }else{
            print("errorCollectionView")
        }
        performSegue(withIdentifier: "ShowTovar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? TovarViewController {
            dest.tagCollection = tagCollection
            dest.tagProduct = tagProduct
            dest.delegate = self
        }else if let dest1 = segue.destination as? OrderViewController{
            dest1.tagColOrderArr = tagColArr
            dest1.tagProOrderArr = tagProArr
            dest1.countProArr = countProds
            dest1.conversion = conversion
        }else if let dest2 = segue.destination as? ProfileViewController{
            dest2.id = tid
        }
    }
    
    func update(tagCol: Int, tagPro: Int, countPro:Int) {
        tagColArr.append(tagCol)
        tagProArr.append(tagPro)
        countProds.append(countPro)
        countBasketLabel.text! = String(tagProArr.count)
        countBasketLabel.isHidden = false
        backViewCount.isHidden = false
        print(tagColArr)
        print(tagProArr)
        print(countProds)
    }
    
    func update1(arr: [Int]) {
        tagProArr = arr
        tagColArr = arr
        countProds = arr
        countBasketLabel.isHidden = true
        backViewCount.isHidden = true
        print("епта бля")
        
    }
}
