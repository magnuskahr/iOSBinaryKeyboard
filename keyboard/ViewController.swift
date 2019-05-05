//
//  ViewController.swift
//  keyboard
//
//  Created by Magnus Jensen on 18/04/2019.
//  Copyright © 2019 Magnus Jensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let keyboard = BinaryKeyboard()
        
        let field = BinaryTextField(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        field.backgroundColor = .red
        field.inputView = keyboard
        
        keyboard.observer = field
        view.addSubview(field)
    }


}

