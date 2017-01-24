//
//  DetailsViewController.swift
//  Task_5
//
//  Created by Kirill Asyamolov on 11/11/16.
//  Copyright © 2016 Kirill Asyamolov. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var delegate: DetailsViewControllerDelegate?
    
    @IBOutlet weak var descriptionTextField: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        descriptionTextField.text = "Robert Peter \"Robbie\" Williams[1] (born 13 February 1974) is an English singer, songwriter and actor. He was a member of the pop group Take That from 1990 to 1995 and again from 2009 to 2012. He has also had commercial success as a solo artist.\n\n" +
        
        "Williams rose to fame in the band's first run in the early-to-mid-1990s. After many disagreements with the management and group members, Williams left the group in 1995 to launch a hugely successful solo career, which saw his first seven albums each reach number one in the UK. Williams also released seven number-one singles and found similar success across Europe.[2] On 15 July 2010, he rejoined Take That. The group's subsequent album Progress became the second fastest-selling album in UK chart history[3] and the fastest-selling record of the century at the time.[4] Gary Barlow has since confirmed that Williams had left the band for a second time, although the departure was amicable and that Williams was welcome to rejoin the band in the future.[5]\n\n" +
        
        "Williams has sold more than 75 million records worldwide, making him one of the best-selling artists of all time.[6] He is the best-selling British solo artist in the United Kingdom and the best selling non-Latino artist in Latin America. Six of his albums are among the top 100 biggest-selling albums in the United Kingdom, and in 2006 he entered the Guinness Book of World Records for selling 1.6 million tickets of his Close Encounters Tour in a single day.[7]"
    }
    

    @IBAction func done_clickHandler(_ sender: AnyObject) {
        delegate!.closeDetailsPopup()
    }


}
