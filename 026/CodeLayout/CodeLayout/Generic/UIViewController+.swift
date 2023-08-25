//
//  UIViewController+.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/24.
//

import Foundation
import UIKit

extension UIViewController {
    func sum<T: AdditiveArithmetic> (num1: T, num2: T) -> T {
        return num1+num2
    }
}
