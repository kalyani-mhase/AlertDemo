//
//  ViewController.swift
//  AlertDemo
//
//  Created by Mac on 08/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextFiled: UITextField!
    enum classException: Error{
        case classIsInValid
        case ageIsValid(minAge: Int)
    }
    //MARK:viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    //MARK:validating()
    func validating()throws  {
        guard let classText = classTextField.text else {
            return
        }
        guard let ageText = ageTextFiled.text else {
            return
        }
        let age = Int(ageText) ?? 0
        
        if classText == "SSC" || classText == "HSC" || classText == "FYBCS" || classText == "SYBCS" || classText == "TYBCS"{
            classTextField.text = classText
        }
        else{
            throw classException.classIsInValid
                }
        
        if  age <= 30{
            
                ageTextFiled.text = ageText
            }else{
                throw classException.ageIsValid(minAge: 30)
         }
        }
    //MARK:btnAction()
@IBAction func btnAction() {
    do {
        try validating()
        
    }catch classException.classIsInValid{
        //creating alert
        let  alert  = UIAlertController(title: "warning", message: "In valid Class: It must be HSC,SSC,FYBCS,SYBCS,TYBCS", preferredStyle: .alert)
        //action to alert
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        //display alert
        self.present(alert, animated: true, completion: nil)
    }catch classException.ageIsValid{
        //creating an alert
        let alert = UIAlertController(title: "warning", message: "in valid Age : It must in between 15 and 30", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }catch {
        let alert = UIAlertController(title: "Alert", message: "Try Again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
    
}

