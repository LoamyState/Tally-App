//
//  SettingsViewController.swift
//  Tally App
//
//  Created by Jane Madsen on 2/16/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var countDirectionSegmentedControl: UISegmentedControl!
    
    @IBOutlet var countByTextField: UITextField!
    @IBOutlet var countByStepper: UIStepper!
    
    @IBOutlet var resetValueTextField: UITextField!
    @IBOutlet var resetValueStepper: UIStepper!
    
    @IBOutlet var counterNameTextField: UITextField!
    
    var counter = Counter()
    var previousView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    fileprivate func updateUI() {
        countDirectionSegmentedControl.selectedSegmentIndex = counter.direction == .up ? 0 : 1
        countByTextField.text = String(counter.increment)
        countByStepper.value = Double(counter.increment)
        resetValueTextField.text = String(counter.resetValue)
        resetValueStepper.value = Double(counter.resetValue)
        counterNameTextField.text = counter.title
        previousView?.updateUI()
    }

    
    @IBAction func changeCountDirection(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            counter.direction = .up
        } else {
            counter.direction = .down
        }
    }
    
    @IBAction func changeIncrementWithCountByStepper(_ sender: UIStepper) {
        counter.increment = Int(sender.value)
        updateUI()
    }
    
    @IBAction func changeIncrementWithTextField(_ sender: UITextField) {
        guard let textFieldValue = Int(sender.text ?? "0") else {
            sender.text = "0"
            return
        }
        counter.increment = Int(textFieldValue)
        updateUI()
        
    }
    
    @IBAction func changeResetValueWithStepper(_ sender: UIStepper) {
        counter.resetValue = Int(sender.value)
        updateUI()
        
    }
    
    @IBAction func changeResetValueWithTextField(_ sender: UITextField) {
        guard let textFieldValue = Int(sender.text ?? "0") else {
            sender.text = "0"
            return
        }
        counter.resetValue = Int(textFieldValue)
        updateUI()
    }
    
    @IBAction func changeCounterName(_ sender: UITextField) {
        counter.title = sender.text
    }
    
    @IBAction func resetCounterSettings(_ sender: Any) {
        counter = Counter()
        updateUI()
    }
    
    @IBAction func dismissView(_ sender: Any) {
        updateUI()
        dismiss(animated: true)
    }
    
    
}

