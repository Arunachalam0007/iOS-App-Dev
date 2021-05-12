//
//  BindingTextField.swift
//  MVVM-WeatherApp-App
//
//  Created by ArunSha on 12/05/21.
//

import Foundation
import UIKit

class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
    }
    
    @objc func textFieldChange(_ textField: UITextField) {
        if let text = textField.text {
            // This is calling the closure func and passing text value in argument
            self.textChangeClosure(text)
        }
    }
    
    func customTextFieldBind (callaback: @escaping (String) -> ()) {
        // Bind or replace function definition to textChangeClosure.
        self.textChangeClosure = callaback
    }
    
}
