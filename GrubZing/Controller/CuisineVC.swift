//
//  CuisineVC.swift
//  GrubZing
//
//  Created by WFX on 12/08/21.
//

import UIKit
import CheckmarkCollectionViewCell

//private let reuseIdentifier = "CheckmarkCollectionViewCell"

class CuisineVC: UICollectionViewController {

        let cellColors = (0 ..< 12).map { _ in UIColor.randomColor(brightness: 1) } // swiftlint:disable:this numbers_smell

    override func viewDidLoad() {
        super.viewDidLoad()
        CheckmarkCollectionViewCell.appearance().checkmarkLocation = [NSLayoutConstraint.Attribute.top, NSLayoutConstraint.Attribute.left]

        collectionView.allowsMultipleSelection = true


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cellColors.count
        }

        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CheckmarkCollectionViewCell", for: indexPath)
            cell.contentView.backgroundColor = cellColors[indexPath.item]
            CheckmarkCollectionViewCell.appearance().checkmarkLocation = [NSLayoutConstraint.Attribute.top, NSLayoutConstraint.Attribute.left]
            
            return cell
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

    extension UIColor {
        public class func randomColor(hue: CGFloat? = nil, saturation: CGFloat? = nil, brightness: CGFloat? = nil) -> UIColor {
            let hue = hue ?? CGFloat(arc4random() % 256) / 256 //  0.0 to 1.0
            let saturation = saturation ?? CGFloat(arc4random() % 128) / 256 + 0.5 //  0.5 to 1.0, away from white
            let brightness = brightness ?? CGFloat(arc4random() % 128) / 256 + 0.5 //  0.5 to 1.0, away from black
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        }
    }
