//
//  WelcomeScreenVC.swift
//  GrubZing
//
//  Created by WFX on 10/08/21.
//

import UIKit



class WelcomeScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        
//        for family: String in UIFont.familyNames
//        {
//            print(family)
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
////                label.font = UIFont(name: "QuicksandDash-Regular", size: 35)
//
//            }
//        }
       
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "GoOnVC") as! GoOnVC
            self.navigationController?.pushViewController(nextVC, animated: true)

            }

        // Do any additional setup after loading the view.
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "GoOnVC") as! GoOnVC
            self.navigationController?.pushViewController(nextVC, animated: true)

            
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
