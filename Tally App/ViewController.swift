//
//  ViewController.swift
//  Tally App
//
//  Created by Jane Madsen on 2/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = Counter()
    
    @IBOutlet var navigationBarItem: UINavigationItem!
    @IBOutlet var counterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        let newTitle = " " + String(counter.value)
        let attributedTitle = NSAttributedString(string: newTitle, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 37)!])
        counterButton.setAttributedTitle(attributedTitle, for: .normal)
        
        if counter.direction == .up {
            counterButton.setImage( UIImage(systemName: "arrow.up.circle"), for: .normal)
        } else {
            counterButton.setImage(UIImage(systemName: "arrow.down.circle"), for: .normal)
        }
        
        navigationBarItem.title = counter.title

    }
    
    @IBAction func increaseCounter(_ sender: Any) {
        if counter.direction == .up {
            counter.value += counter.increment } else {
                counter.value -= counter.increment
            }
        updateUI()
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        counter.value = counter.resetValue
        updateUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SettingsViewController else {return}
        
        destination.counter = counter
        destination.previousView = self
    }
    
    
    
}
