//
//  SettingsViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var myStepper: UIStepper!
    
    @IBOutlet weak var alternatingCellLabel: UILabel!
    @IBOutlet weak var numberOfRowsLabel: UILabel!
    @IBOutlet weak var fontSegmentedController: UISegmentedControl!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBAction func alternatingCellSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func numberOfRowsStepper(_ sender: UIStepper) {
        Settings.numberOfRows = Int(sender.value)
        numberOfRowsLabel.text = "Number of Rows:   \(Settings.numberOfRows)"
        print("Stepper value", Settings.numberOfRows)
    }
    
    
    @IBAction func fontSegmentedControll(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Settings.font = "Times New Roman"
            Settings.textCase = .capital
            print(Settings.textCase)
        case 1:
            Settings.textCase = .lower
            print(Settings.textCase)
        case 2:
            Settings.textCase = .upper
            print(Settings.textCase)
        default:
            Settings.font = "Arial"
        }
    }
    
    @IBAction func redSlider(_ sender: UISlider) {
        Settings.red = sender.value
    }
    
    @IBAction func GreenSlider(_ sender: UISlider) {
        Settings.green = sender.value
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        Settings.blue = sender.value
    }
    override func viewDidLayoutSubviews() {
        numberOfRowsLabel.text = "Number of Rows:   \(Settings.numberOfRows)"
//        myStepper.value = Double(Settings.numberOfRows)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfRowsLabel.text = "Number of Rows:   \(Settings.numberOfRows)"
        myStepper.maximumValue = Double(Settings.numberOfRows)
        myStepper.value = Double(Settings.numberOfRows)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
