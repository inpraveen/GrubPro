//
//  VerifyNumberVC.swift
//  GrubZing
//
//  Created by WFX on 10/08/21.
//

import UIKit


class VerifyNumberVC: UIViewController {
    @IBOutlet weak var btnSendOTP : UIButton!
    @IBOutlet weak var lblFlag: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var lblCountryCode: UILabel!
    
    
    var countriesViewController = CountriesViewController()
    var countryCode: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetup()
        setupCountryPicker()


        // Do any additional setup after loading the view.
    }
    
    @IBAction func getOTPButtonAction(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    func initalSetup(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBord))
        view.addGestureRecognizer(tap)
        btnSendOTP.layer.cornerRadius = btnSendOTP.frame.size.height / 2
        btnSendOTP.clipsToBounds = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // MARK:- Keyboard delegate Methods
    /// method will be call when keyboard will appear
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func dismissKeyBord(){
        self.view.endEditing(true)
    }
    // method will be call when keyboard will close
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    // MARK:- Custom methods
    // Set country picker
    func setupCountryPicker(){
        self.countriesViewController = CountriesViewController()
        self.countriesViewController.delegate = self
        self.countriesViewController.allowMultipleSelection = false
        if let info = self.getCountryAndName() {
            countryCode = info.countryCode!
            self.lblFlag.text = info.countryFlag!
            self.lblCountryCode.text = info.countryCode!
        }
    }
    //Method is used for getiing country data which is stored in json file
    private func getCountryAndName(_ countryParam: String? = nil) -> CountryModel? {
        if let path = Bundle.main.path(forResource: "CountryCodes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonObj = JSON(data)
                let countryData = CountryListModel.init(jsonObj.arrayValue)
                let locale: Locale = Locale.current
                var countryCode: String?
                if countryParam != nil {
                    countryCode = countryParam
                } else {
                    countryCode = locale.regionCode
                }
                let currentInfo = countryData.country?.filter({ (cm) -> Bool in
                    return cm.countryShortName?.lowercased() == countryCode?.lowercased()
                })
                
                if currentInfo!.count > 0 {
                    return currentInfo?.first
                } else {
                    return nil
                }
                
            } catch {
                // handle error
            }
        }
        return nil
    }
    //Method is used for validation of phone number
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    //Method is used to show alert
    func showAlertMessage(_ message : String){
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Action Events
    //Show country picker
    @IBAction func btnCountryPicker(_ sender: UIButton) {
        
        DispatchQueue.main.async {
            CountriesViewController.show(countriesViewController: self.countriesViewController, toVar: self)
        }
    }
    
    //Method is used when done button is tap on key and it checks validation
    @IBAction func btnSendOtp(_ sender: Any) {
        if txtPhoneNumber.text == ""{
            self.showAlertMessage("Enter mobile number")
        }
        else{
            if isValidPhone(phone: txtPhoneNumber.text!)
            {
//                self.showAlertMessage("Success: Valid mobile number")
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
                self.navigationController?.pushViewController(nextVC, animated: true)
                
            }
            else{
                self.showAlertMessage("Failure: Invalid phone number")
            }
        }
        
    }
    
}

//Countrycode delegate methods
extension VerifyNumberVC: CountriesViewControllerDelegate {
    func countriesViewController(_ countriesViewController: CountriesViewController, didSelectCountries countries: [Country]) {
        
        countries.forEach { co in
            //            Logger.println(co.name)
        }
    }
    func countriesViewControllerDidCancel(_ countriesViewController: CountriesViewController) {
        
        //        Logger.println("user hass been tap cancel")
        
    }
    func countriesViewController(_ countriesViewController: CountriesViewController, didSelectCountry country: Country) {
        if let info = self.getCountryAndName(country.countryCode) {
            countryCode = info.countryCode!
            self.lblFlag.text = info.countryFlag!
            self.lblCountryCode.text = info.countryCode!
        }
    }
    func countriesViewController(_ countriesViewController: CountriesViewController, didUnselectCountry country: Country) {
        
        //        Logger.println(country.name + " unselected")
        
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

