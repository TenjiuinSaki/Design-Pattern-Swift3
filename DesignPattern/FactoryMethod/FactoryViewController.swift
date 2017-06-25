//
//  FactoryViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/1.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit

/**
 工厂方法：定义一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法使一个类的实例化延迟到其子类。
 */

class FactoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /// 通过类型获取不同的实例化对象
        var cal = CalcuteFactory.createCalculate(type: .multiply)
        cal.num1 = 3
        cal.num2 = 4
        print(cal.calculate())
    }

}

protocol Calculate {
    var num1: CGFloat {set get}
    var num2: CGFloat {set get}
    func calculate() -> CGFloat
}

class CalculateAdd: Calculate {
    var num1: CGFloat = 0
    var num2: CGFloat = 0
    func calculate() -> CGFloat {
        return num1 + num2
    }
}
class CalculateMinus: Calculate {
    var num1: CGFloat = 0
    var num2: CGFloat = 0
    func calculate() -> CGFloat {
        return num1 - num2
    }
}
class CalculateMultiply: Calculate {
    var num1: CGFloat = 0
    var num2: CGFloat = 0
    func calculate() -> CGFloat {
        return num1 * num2
    }
}
class CalculateDivide: Calculate {
    var num1: CGFloat = 0
    var num2: CGFloat = 0
    func calculate() -> CGFloat {
        if num2 == 0 {
            assertionFailure("非法运算")
        }
        return num1 / num2
    }
}

class CalcuteFactory {
    enum CalType {
        case add
        case minus
        case multiply
        case divide
    }
    class func createCalculate(type: CalType) -> Calculate {
        switch type {
        case .add:
            return CalculateAdd()
        case .minus:
            return CalculateMinus()
        case .multiply:
            return CalculateMultiply()
        case .divide:
            return CalculateDivide()
        }
        
        
    }
}
