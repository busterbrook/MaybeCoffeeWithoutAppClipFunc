//
//  OrderViewController.swift
//  DMD
//
//  Created by  фф on 29.04.2021.
//

import UIKit

protocol OrderViewControllerDelegate: class {
    func update(arr: [Int])
}

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, OrderViewControllerDelegate {
    
    weak var delegate: MainViewControllerDelegate?
   
    @IBOutlet var tableOrder: UITableView!
    
    @IBOutlet var BuyButton: UIButton!
    @IBOutlet var SumLabel: UILabel!
    @IBOutlet var BuyBackView: UIView!
    @IBOutlet var emptyBasketLabel: UILabel!
    
    var sum: Int = 0
    var conversion: Int = 0
    var emptyArr: [Int] = []
    var tagColOrderArr: [Int] = []
    var tagProOrderArr: [Int] = []
    var nameArr: [String] = []
    var priceArr: [Int] = []
    var imageArr: [UIImage] = []
    var countProArr: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BuyButton.layer.cornerRadius = 10
        
        nameArr = model.init().createNameArrOrde(tagCollection: tagColOrderArr, tagProduct: tagProOrderArr)
        priceArr  = model.init().createPriceArrOrde(tagCollection: tagColOrderArr, tagProduct: tagProOrderArr)
        imageArr = model.init().createImageArrOrde(tagCollection: tagColOrderArr, tagProduct: tagProOrderArr)
        
        let nibCell = UINib(nibName: "orderTableViewCell", bundle: nil)
        tableOrder.register(nibCell, forCellReuseIdentifier: "tableCell")
        
        if tagColOrderArr.count == 0{
            tableOrder.isHidden = true
            emptyBasketLabel.isHidden = false
            emptyBasketLabel.text! = "Корзина пока пуста :("
        }else{
            tableOrder.isHidden = false
            emptyBasketLabel.isHidden = true
        }
        
        sum = model.init().summOrder(priceArr: priceArr, countArr: countProArr)
        SumLabel.text! = String(sum) + " Р"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tagColOrderArr.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! orderTableViewCell
        cell.nameTovar.text! = nameArr[indexPath.row]
        cell.priceTovar.text! = String(priceArr[indexPath.row]) + " Р"
        cell.imageTovar.image = imageArr[indexPath.row]
        cell.countTovar.text! = String(countProArr[indexPath.row])
        return cell
    }

    @IBAction func BackFunc(_ sender: Any) {
        delegate?.update1(arr: emptyArr)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func update(arr: [Int]) {
        tagColOrderArr = arr
        tagProOrderArr = arr
        countProArr = arr
        tableOrder.reloadData()
        tableOrder.isHidden = true
        emptyBasketLabel.isHidden = false
        emptyBasketLabel.text! = "Спасибо за заказ!"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PayViewController {
            dest.endSum = sum
            dest.conversion = conversion
            dest.delegate = self
        }
        
    }
    
}
