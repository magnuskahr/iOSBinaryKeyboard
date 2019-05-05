//
//  BinaryTextField.swift
//  keyboard
//
//  Created by Magnus Jensen on 05/05/2019.
//  Copyright © 2019 Magnus Jensen. All rights reserved.
//

import Foundation
import UIKit

class BinaryTextField: UITextField, BinaryKeyboardObserver {
    func add(_ string: String) {
        self.text?.append(string)
    }
}
