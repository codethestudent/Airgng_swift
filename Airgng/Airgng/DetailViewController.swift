//
//  DetailViewController.swift
//  Airgng
//
//  Created by 하준영 on 2022/03/06.
//

import UIKit


class DetailViewController: UIViewController {


    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var equipImage: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var recLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rate: UILabel!
    
    var index: fit?
    var images: [String] = []
    var imageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftButton.isEnabled = false
    }
    
    @IBAction func leftImage(_ sender: Any) {
        imageIndex -= 1
        self.showImage(index: imageIndex)
    }
    
    @IBAction func rightImage(_ sender: Any) {
        imageIndex += 1
        self.showImage(index: imageIndex)
        
    }
    
    func showImage (index: Int){
        let imageName = images[index]
        equipImage.image = UIImage(named: imageName)
        
        leftButton.isEnabled = index > 0
        rightButton.isEnabled = index < images.count - 1
    }
    
    @IBAction func handleLike(_ sender: Any) {
        likeButton.isSelected = !likeButton.isSelected
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = index {
            name.text = index.fitnessEquip
            label1.text = index.fitnessEquip
            label2.text = index.userName
            equipImage.image = UIImage(named: index.thumbnail)
            price.text = String(index.price)
            weight.text = index.weight
            size.text = index.size
            rate.text = String(index.rate)
            
            images = index.detailImage ?? []
            showImage(index: 0)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
