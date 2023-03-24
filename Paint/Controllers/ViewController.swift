//
//  ViewController.swift
//  Paint
//
//  Created by Bekzhan on 21.10.2022.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var undoButton: UIButton!
    @IBOutlet var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(undoButtonLongPressed))
        
        undoButton.addGestureRecognizer(longPressGesture)
    }
    
    
    @IBAction func figureButtonsTapped(_ sender: UIButton) {
        guard let select = sender.restorationIdentifier else { return }
        customView.selection =  select
        print("\(select) selected")
    }
    
    @IBAction func colorSelected(_ sender: UIButton) {
        customView.color = sender.tintColor
        print("Color selected")
    }
    
    
    @IBAction func undoButtonTapped(_ sender: UIButton) {
        customView.undo()
    }
    
    
    @objc func undoButtonLongPressed() {
        customView.clear()
    }
    
    
    @IBAction func switchButtonTapped(_ sender: UISwitch) {
        if(sender.isOn) {
            customView.isFill = true
            print("Switch is on")
        } else {
            customView.isFill = false
            print("Switch is off")
        }
    }
}

