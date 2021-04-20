//
//  CalcBMIBrain.swift
//  BMI-Calc
//
//  Created by ArunSha on 19/03/21.
//

import UIKit

struct CalcBMIBrain {
    
    var bmi: BMI?
    
    mutating func calcBMI(height:Float, weight:Float) {
       let  calculatedBMIValue =  weight / pow(height, 2)
        
        if calculatedBMIValue < 18.5  {
            bmi = BMI(bmiValue: calculatedBMIValue, bmiAdvice: "Eat More Pies!", bmiColor: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if calculatedBMIValue < 24.9 {
            bmi = BMI(bmiValue: calculatedBMIValue, bmiAdvice: "Fit to Fiddle!", bmiColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))

        } else {
            bmi = BMI(bmiValue: calculatedBMIValue, bmiAdvice: "Eat Less Pies!", bmiColor: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        }
        
    }
    func getBMIValue() -> String {
        return  String(format: "%.1f", bmi?.bmiValue ?? 0.0) // access the property for optional struct object
    }
    func getBMIAdvice() -> String {
        return bmi?.bmiAdvice ?? ""
    }
    func getBMIColor() -> UIColor {
        return bmi?.bmiColor ?? UIColor()
    }
    
}
