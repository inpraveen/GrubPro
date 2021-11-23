//
//  GoOnVC.swift
//  GrubZing
//
//  Created by WFX on 10/08/21.
//

import UIKit

class GoOnVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func yesButtonAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TutorialOneVC") as! TutorialOneVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func noButtonAction(_ sender: Any) {
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
