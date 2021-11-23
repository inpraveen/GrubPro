//
//  TutorialOneVC.swift
//  GrubZing
//
//  Created by WFX on 10/08/21.
//

import UIKit
import paper_onboarding
class TutorialOneVC: UIViewController {


//class TutorialOneVC: UIViewController,PaperOnboardingDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
      
//        let onboarding = PaperOnboarding()
//         onboarding.dataSource = self
//         onboarding.translatesAutoresizingMaskIntoConstraints = false
//         view.addSubview(onboarding)
//
//         // add constraints
//        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
//           let constraint = NSLayoutConstraint(item: onboarding,
//                                               attribute: attribute,
//                                               relatedBy: .equal,
//                                               toItem: view,
//                                               attribute: attribute,
//                                               multiplier: 1,
//                                               constant: 0)
//           view.addConstraint(constraint)
         }

        // Do any additional setup after loading the view.
//    }
    func onboardingItem(at index: Int) -> OnboardingItemInfo {

       return [
        
        OnboardingItemInfo(informationImage: UIImage(named: "dietimage")!,
                           title: "Hotels",
                           description: "All hotels and hostels are sorted by hospitality rating",
                           pageIcon: UIImage(named: "dietimage")!,
                           color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: TutorialOneVC.titleFont, descriptionFont: TutorialOneVC.descriptionFont),
        
        OnboardingItemInfo(informationImage: UIImage(named: "cookillustration")!,
                           title: "Banks",
                           description: "We carefully verify all banks before add them into the app",
                           pageIcon: UIImage(named: "dietimage")!,
                           color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: TutorialOneVC.titleFont, descriptionFont: TutorialOneVC.descriptionFont),
        
        OnboardingItemInfo(informationImage: UIImage(named: "SECONDILLUSTRATION")!,
                           title: "Stores",
                           description: "All local stores are categorized for your convenience",
                           pageIcon: UIImage(named: "dietimage")!,
                           color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: TutorialOneVC.titleFont, descriptionFont: TutorialOneVC.descriptionFont),
        
//        OnboardingItemInfo(informationImage: UIImage(named: "dietimage")!,
//                                       title: "title",
//                                 description: "description",
//                                    pageIcon: UIImage(named: "afternoon")!,
//                                       color: UIColor.RANDOM,
//                                  titleColor: UIColor.RANDOM,
//                            descriptionColor: UIColor.RANDOM,
//                                   titleFont: UIFont.FONT,
//                             descriptionFont: UIFont.FONT),
//
//         OnboardingItemInfo(informationImage: UIImage(named: "cookillustration")!,
//                                        title: "title",
//                                  description: "description",
//                                     pageIcon: UIImage(named: "afternoon")!,
//                                        color: UIColor.RANDOM,
//                                   titleColor: UIColor.RANDOM,
//                             descriptionColor: UIColor.RANDOM,
//                                    titleFont: UIFont.FONT,
//                              descriptionFont: UIFont.FONT),
//
//        OnboardingItemInfo(informationImage: UIImage(named: "SECONDILLUSTRATION")!,
//                                     title: "title",
//                               description: "description",
//                                  pageIcon: UIImage(named: "afternoon")!,
//                                     color: UIColor.RANDOM,
//                                titleColor: UIColor.RANDOM,
//                          descriptionColor: UIColor.RANDOM,
//                                 titleFont: UIFont.FONT,
//                           descriptionFont: UIFont.FONT)
         ][index]
     }

     func onboardingItemsCount() -> Int {
        return 3
      }
    
    func onboardingConfigurationItem(item: OnboardingContentViewItem, index: Int) {

    //    item.titleLabel?.backgroundColor = .redColor()
    //    item.descriptionLabel?.backgroundColor = .redColor()
    //    item.imageView = ...
      }

    @IBAction func nextbuttonAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TutorialTwoVC") as! TutorialTwoVC
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

//MARK: Constants
private extension TutorialOneVC {
    
    static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}
