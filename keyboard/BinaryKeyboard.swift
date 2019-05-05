//
//  PointGivingInputViewController.swift
//  Styr på Point
//
//  Created by Magnus Jensen on 15/02/2019.
//  Copyright © 2019 Magnus Jensen. All rights reserved.
//

import UIKit

class BinaryKeyboard: UIInputView {
    
    /// Observers telling when keys were hit
    weak var observer: BinaryKeyboardObserver?
    
    private lazy var stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.frame = frame
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        addSubview(stackview)
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        let guide = safeAreaLayoutGuide
        
        var constraints = [
            stackview.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1),
            stackview.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -8)
        ]
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            constraints.append(stackview.leftAnchor.constraint(equalToSystemSpacingAfter: guide.leftAnchor, multiplier: 1))
            constraints.append(stackview.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -8))
        case .pad:
            constraints.append(stackview.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5))
        default: break
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return stackview
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 300), inputViewStyle: .keyboard)
        addButton(with: "0", and: NormalKeyButtonFormatter())
        addButton(with: "1", and: NormalKeyButtonFormatter())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addButton(with title: CustomStringConvertible, and formatter: KeyboardButtonFormatter) {
        let button = KeyboardButton(title: title, formatter: formatter)
        button.delegate = self
        stackview.addArrangedSubview(button)
    }
}

extension BinaryKeyboard: KeyboardButtonDelegate {
    func keyWasHit(_ button: KeyboardButton) {
        
        guard let title = button.titleLabel?.text else {
            return
        }
            
        UIDevice.current.playInputClick()
        
        observer?.add(title)
    }
}

extension BinaryKeyboard: UIInputViewAudioFeedback {
    /// Required for playing system click sound
    var enableInputClicksWhenVisible: Bool { return true }
}
