//
//  EnableLocationVC.swift
//  GrubZing
//
//  Created by WFX on 10/08/21.
//

import UIKit
import CoreLocation

class EnableLocationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)

           LocationManager.shared.requestLocationAuthorization()
       }

    
    class LocationManager: NSObject, CLLocationManagerDelegate {

        static let shared = LocationManager()
        private var locationManager: CLLocationManager = CLLocationManager()
        private var requestLocationAuthorizationCallback: ((CLAuthorizationStatus) -> Void)?

        public func requestLocationAuthorization() {
            self.locationManager.delegate = self
            let currentStatus = CLLocationManager.authorizationStatus()

            // Only ask authorization if it was never asked before
            guard currentStatus == .notDetermined else { return }

            // Starting on iOS 13.4.0, to get .authorizedAlways permission, you need to
            // first ask for WhenInUse permission, then ask for Always permission to
            // get to a second system alert
            if #available(iOS 13.4, *) {
                self.requestLocationAuthorizationCallback = { status in
                    if status == .authorizedWhenInUse {
                        self.locationManager.requestAlwaysAuthorization()
                    }
                }
                self.locationManager.requestWhenInUseAuthorization()
            } else {
                self.locationManager.requestAlwaysAuthorization()
            }
        }
        // MARK: - CLLocationManagerDelegate
        public func locationManager(_ manager: CLLocationManager,
                                    didChangeAuthorization status: CLAuthorizationStatus) {
            self.requestLocationAuthorizationCallback?(status)
        }
    }
    
//    @IBAction func nextPageButtonAction(_ sender: Any) {
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TutorialThreeVC") as! TutorialThreeVC
//        self.navigationController?.pushViewController(nextVC, animated: true)
//        
//    }
    @IBAction func shareLocationButtonAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
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
