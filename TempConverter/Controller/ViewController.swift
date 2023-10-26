//
//  ViewController.swift
//  TempConverter
//
//  Created by liga.griezne on 26/10/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedTempLabel: UILabel!
    
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var tempView: UIBarButtonItem!
    
    @IBOutlet weak var tempSlider: UISlider! {
        
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    let tempSharedInstance = DataManager.sharedInstance
    
    let fahrSliderIndex = 0
    let kelvinSliderIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedTempLabel.text = "32 ºF"
        tempSlider.value = 0.0
        tempSegmentControl.selectedSegmentIndex = 0
        
        tempSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        tempSegmentControl.addTarget(self, action: #selector(segmentControlerValueChanged), for: .valueChanged)
    }
    
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    func updateTempLabelFromSlider(value: Float) {
        let celsiusTemp = tempSlider.value
        let roundCelsiusTemp = Int(celsiusTemp)
        
        let fahrenheit = (Double(celsiusTemp) * (9/5)) + 32
        let kelvin = Double(celsiusTemp) + 273.15
        
        if tempSegmentControl.selectedSegmentIndex == fahrSliderIndex {
            convertedTempLabel.text = String(format: "%.2f ºF", fahrenheit)
            
        } else if tempSegmentControl.selectedSegmentIndex == kelvinSliderIndex {
            convertedTempLabel.text = String(format: "%.2f K", kelvin)
        }
        
        celsiusLabel.text = "\(roundCelsiusTemp) ºC"
        
        tempSharedInstance.fahrenheit = fahrenheit
        tempSharedInstance.kelvin = kelvin
        
    }
    
    @objc func segmentControlerValueChanged(sender: UISegmentedControl){
        sliderValueChanged(Double.self)
    }
    
}

//#warning("pass result to InfoVC without segue")


