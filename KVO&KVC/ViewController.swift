//
//  ViewController.swift
//  KVO&KVC
//
//  Created by Вячеслав Квашнин on 10.05.2022.
//

import UIKit

class Person: NSObject {
    @objc dynamic var name = String()
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @objc let taylor = Person()
    
    @objc dynamic var inputText: String?
    
    var nameObservation: NSKeyValueObservation?
    var inputTextObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameObservation = observe(\.taylor.name, options: [.new, .old]) { vc, change in
            guard let updateName = change.newValue else { return }
            vc.nameLabel.text = updateName
            print(change.oldValue)
        }
        
        inputTextObservation = observe(\.inputText, options: .new) { vc, change in
            guard let inputTextUpdate = change.newValue as? String else { return }
            vc.textLabel.text = inputTextUpdate
        }
    }

    @IBAction func pressButton(_ sender: Any) {
        taylor.name = "Slava"
    }
    
    @IBAction func textFieldEditing(_ sender: Any) {
        inputText = textField.text
    }
}

