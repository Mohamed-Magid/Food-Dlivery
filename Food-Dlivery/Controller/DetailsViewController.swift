//
//  DetailsViewController.swift
//  Food-Dlivery
//
//  Created by Hany Karam on 12/7/19.
//  Copyright © 2019 Hany Karam. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
      @IBOutlet weak var addcart: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var numbercart: UILabel!
    var food = [Model]()
    var counterItem = 0
    var items:[Model] = []
    var item:Model?
    var index = 0
    var searching = false

    var searchcountry = [Model]()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "home" ){
            let des = segue.destination as! CartViewController
            
        }
        else
        {
      let des = segue.destination as! FoodDetailsViewController
        
        des.item = self.food[index]
        
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        food.append(Model(image: "Chicken-MACDO-Deluxe-Spicy-2", title: "Chicken MACDO Deluxe Spicy", price: 50 , des: "A gently spiced breaded chicken patty garnished with freshly cut lettuce, one slice of melty cheese, a fresh tomato slice and mayonnaise all wrapped in a freshly baked bun.", id: 0, quantity: 1))
      
        
        food.append(Model(image: "McNuggets-9psc", title: "McNuggets", price: 60 , des: "Everything's better when it's bite-sized. Like our nuggets made with tender juicy chicken breast in a crisp tempura coating. Start the fun with our delicious dipping sauces, in BBQ or Sweet 'n Sour", id: 1, quantity: 2))
        
        
        food.append(Model(image: "Filet-O-Fish", title: "Filet Fish", price: 80 , des: "Catch a delicious Filet-O-Fish. Delicious breaded fish filet with tartar sauce and melty cheese served in a steamed bun.", id: 2, quantity: 3))
        
        food.append(Model(image: "Large-Frise-1", title: "Large Frise", price: 70 , des: "Get them while they're hot. Our legendary super-tasty French fries are the perfect side to any meal. We only use the highest quality potatoes to create those delicious strands of crispy fluffy fries you love.", id: 3, quantity: 4))
        
        
        food.append(Model(image: "Zero", title: "Pepsi", price: 10 , des: "Zero calories, zero sugar, same great Coca-Cola taste. Perfect with your meal, or as a refreshing drink.", id: 4, quantity: 5))
        
        
        food.append(Model(image: "Fanta", title: "Fanta", price: 10 , des: "Refreshing, fruity, tangy, and tempting. Go for it!", id: 5, quantity: 6))
        
        food.append(Model(image: "Screen Shot 2019-12-07 at 5.14.22 AM", title: "SUPER SUPREME", price: 90 , des: "Our famous combination of Beef Pepperoni, juicy Beef, Mushrooms, Green Peppers, Onions, Black Olives and melting mozzarella cheese.", id: 6, quantity: 7))
        
        
        food.append(Model(image: "Image", title: "SUPER SUPREME", price: 70 , des: "Go Back to where it all began with the classic cheese and tomato base", id: 7, quantity: 8))
        
        food.append(Model(image: "Large-Frise-1", title: "SUPER SUPREME", price: 10 , des: "Go Back to where it all began with the classic cheese", id: 8, quantity: 9))
        
        
        food.append(Model(image: "prawn-min1", title: "prawn min", price: 60 , des: "The Ultimate Seafood pizza! Generously Topped with a sea of prawns, Calamari, Parsley and a touch of Garlic", id: 9, quantity: 10))
        
        food.append(Model(image: "Tuna", title: "Tuna", price: 60 , des: "Indulge in a flavourful combination of Tuna, Black Olives, Green Peppers and topped with melting mozzarella cheese.", id: 10, quantity: 11))
        
        
     
        
        numbercart.layer.cornerRadius = numbercart.frame.size.height / 2
        numbercart.clipsToBounds = true
        
        
    }
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailsTableViewCell
        cell.img.image = UIImage(named: food[indexPath.row].image)
        cell.decrvtion.text = food[indexPath.row].des
        cell.price.text = String(food[indexPath.row].price)
        cell.title.text = food[indexPath.row].title
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "Home", sender: self)
        
    }

    @IBAction func addcart(_ sender: Any) {
        
        
        let buttonPosition : CGPoint = (sender as AnyObject).convert((sender as AnyObject).bounds.origin, to: self.tableview)
        
        let indexPath = self.tableview.indexPathForRow(at: buttonPosition)!
        
        let cell = tableview.cellForRow(at: indexPath) as! DetailsTableViewCell
        
        let imageViewPosition : CGPoint = cell.img.convert(cell.img.bounds.origin, to: self.view)
        
      
            CartManager.shared.addItem(food[indexPath.row])
        
        let imgViewTemp = UIImageView(frame: CGRect(x: imageViewPosition.x, y: imageViewPosition.y, width: cell.img.frame.size.width, height: cell.img.frame.size.height))
        
        imgViewTemp.image = cell.img.image
        
        animation(tempView: imgViewTemp)
    }
    
    func animation(tempView : UIView)  {
        self.view.addSubview(tempView)
        UIView.animate(withDuration: 1.0,
                       animations: {
                        tempView.animationZoom(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            
            UIView.animate(withDuration: 0.5, animations: {
                
                tempView.animationZoom(scaleX: 0.2, y: 0.2)
                tempView.animationRoted(angle: CGFloat(Double.pi))
                
                tempView.frame.origin.x = self.addcart.frame.origin.x
                tempView.frame.origin.y = self.addcart.frame.origin.y
                
            }, completion: { _ in
                
                tempView.removeFromSuperview()
                
                UIView.animate(withDuration: 1.0, animations: {
                    
                    self.counterItem += 1
                    self.numbercart.text = "\(self.counterItem)"
                    self.addcart.animationZoom(scaleX: 1.4, y: 1.4)
                }, completion: {_ in
                    self.addcart.animationZoom(scaleX: 1.0, y: 1.0)
                })
                
            })
            
        })
    }
    

    

  
 
}


extension UIView{
    func animationZoom(scaleX: CGFloat, y: CGFloat) {
        self.transform = CGAffineTransform(scaleX: scaleX, y: y)
    }
    
    func animationRoted(angle : CGFloat) {
        self.transform = self.transform.rotated(by: angle)
    }
    
}

