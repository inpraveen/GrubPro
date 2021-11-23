//
//  OtpVC.swift
//  GrubZing
//
//  Created by WFX on 13/08/21.
//

import UIKit
import OTPFieldView

enum DisplayType: Int {
    case circular
    case roundedCorner
    case square
    case diamond
    case underlinedBottom
}

class OtpVC: UIViewController {

    @IBOutlet var otpTextFieldView: OTPFieldView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOtpView()

//    grey ECEDF1 151 151 151
//        FC8B56 color 252,139,86
//        let purple = UIColor(hex: 0xFC8B56)

        // Do any additional setup after loading the view.
    }
    func setupOtpView(){
//        let purple = UIColor(hex: 0xFC8B56)
//        let grey = UIColor.init(hex:"ECEDF1"
        
            self.otpTextFieldView.fieldsCount = 4
            self.otpTextFieldView.fieldBorderWidth = 2
        self.otpTextFieldView.otpInputType = .numeric
        self.otpTextFieldView.fieldFont = UIFont.systemFont(ofSize: 20)
//        self.otpTextFieldView.errorBorderColor =  UIColor(red:252, green: 139, blue: 86, alpha: 1.0)
        self.otpTextFieldView.cursorColor = UIColor.white
        self.otpTextFieldView.defaultBackgroundColor = UIColor.gray;    self.otpTextFieldView.filledBackgroundColor = UIColor.orange
        self.otpTextFieldView.defaultBorderColor = UIColor.white
        self.otpTextFieldView.filledBorderColor = UIColor.white


        
        self.otpTextFieldView.displayType = .circular
            self.otpTextFieldView.fieldSize = 60
            self.otpTextFieldView.separatorSpace = 15
            self.otpTextFieldView.shouldAllowIntermediateEditing = false
            self.otpTextFieldView.delegate = self
            self.otpTextFieldView.initializeUI()
        
    
        
        
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
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "EnableLocationVC") as! EnableLocationVC
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }

    
    

}


extension OtpVC: OTPFieldViewDelegate {
    func hasEnteredAllOTP(hasEnteredAll hasEntered: Bool) -> Bool {
        print("Has entered all OTP? \(hasEntered)")
        return false
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp otpString: String) {
        print("OTPString: \(otpString)")
    }
}


