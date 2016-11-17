//
//  AboutViewController.swift
//  Task_5
//
//  Created by Kirill Asyamolov on 11/11/16.
//  Copyright © 2016 Kirill Asyamolov. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, DetailsViewControllerDelegate {

    let segueIdentifierShowDetails = "showDetails"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func closeDetailsPopup() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        if segue.identifier == segueIdentifierShowDetails {
            let uiViewController = segue.destination
            let detailsViewController: DetailsViewController = uiViewController.childViewControllers.last as! DetailsViewController
            detailsViewController.delegate = self

        }
    }
    
    @IBAction func showAlert_clickHandler(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Test message", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func showAnotherAlert_clickHandler(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Title", message: "Show detailed info?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.performSegue(withIdentifier: self.segueIdentifierShowDetails, sender: self)
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    

}
