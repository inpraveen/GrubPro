//
//  CuisineCollectionVC.swift
//  GrubZing
//
//  Created by WFX on 13/08/21.
//

import UIKit

class CuisineCollectionVC: UIViewController {
    
//    let nameArr = ["Ram" , "Shyam", "Joe", "Mark", "Richard", "Remo"]
        let cusineNameArr = ["Mexican","Indian","Europian","American","Italian"]


    
    @IBOutlet weak var cuisineCollectionView: UICollectionView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        cuisineCollectionView.allowsMultipleSelection = true


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func continueButtonAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DietSelectorVC") as! DietSelectorVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
extension CuisineCollectionVC:UICollectionViewDataSource{
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cusineNameArr.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CusineListCollectionCell", for: indexPath) as! CusineListCollectionCell
            cell.cuisineNameLabel.text = cusineNameArr[indexPath.row]
//            cell.cuisineImage.backgroundColor = .blue
            return cell
    }
    
  

   
    
}

extension CuisineCollectionVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "Hi", message: "\(cusineNameArr[indexPath.row])", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.addAction(action)
//        self.present(alert, animated: true, completion: nil)
    }
    
    private func collectionView(collectionView: UICollectionView, shouldSelectItemAt indexPath: NSIndexPath) -> Bool {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            if selectedItems.contains(indexPath as IndexPath) {
                collectionView.deselectItem(at: indexPath as IndexPath, animated: true)
                return false
            }
        }
        return true
    }
    
}



class CusineListCollectionCell: UICollectionViewCell{
    
    @IBOutlet weak var cuisineImage: UIImageView!
    @IBOutlet weak var cuisineNameLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 3.0
            self.layer.borderColor = isSelected ? UIColor.blue.cgColor : UIColor.clear.cgColor
        }
    }
    
    
    
}
