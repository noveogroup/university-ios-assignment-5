//
//  ColorViewController.swift
//  Task_5
//
//  Created by Kirill Asyamolov on 06/11/16.
//  Copyright © 2016 Kirill Asyamolov. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController, UITextFieldDelegate {

    //MARK: Controls

    @IBOutlet weak var rColorSlider: UISlider!
    @IBOutlet weak var gColorSlider: UISlider!
    @IBOutlet weak var bColorSlider: UISlider!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var nextScreenButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var currentDevice: UIDevice?
    var orientation: UIDeviceOrientation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentDevice = UIDevice.current
        orientation = currentDevice!.orientation
        
        colorTextField.delegate = self
        
        let controllersCount = navigationController!.viewControllers.count
        let titleName = String(describing: controllersCount)
        navigationItem.title = (self.navigationController!.tabBarItem.title)! + ": " + titleName
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        colorChangedBySlider(self)
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyboardWillShow(notification:)),
                         name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default
            .addObserver(self, selector:#selector(keyboardWillHide(notification:)),
                         name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        return UIColor.validHexString(newString)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let hexColor = "#" + textField.text! + "FF"

        let color = UIColor(hexString: hexColor)
        view.backgroundColor = color
        if let components = color?.getComponents() {
            rColorSlider.value = components[0]
            gColorSlider.value = components[1]
            bColorSlider.value = components[2]
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        scrollView.scrollRectToVisible(textField.frame, animated: true)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: Actions
    @IBAction func colorChangedBySlider(_ sender: AnyObject) {
        let uiColor = UIColor(colorLiteralRed: rColorSlider.value, green: gColorSlider.value, blue: bColorSlider.value, alpha: 1)
        view.backgroundColor = uiColor
        colorTextField.text = uiColor.hex()
    }
}

private extension ColorViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        let size = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, size.height, 0)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
    }
}
