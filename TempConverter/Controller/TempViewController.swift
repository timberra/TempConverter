//
//  TempViewController.swift
//  TempConverter
//
//  Created by liga.griezne on 26/10/2023.
//

import UIKit

class TempViewController: UIViewController {
    
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var kelvinLabel: UILabel!
    
    let dataManagerInstance = DataManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        fahrenheitLabel.text = String(format: "%.2f ºF", dataManagerInstance.fahrenheit)
        kelvinLabel.text = String(format: "%.2f K", dataManagerInstance.kelvin)

        // Do any additional setup after loading the view.
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
