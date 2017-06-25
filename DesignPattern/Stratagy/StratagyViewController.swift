//
//  StratagyViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/5/22.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

/**
 策略模式：调同样的方法有不同的实现，类似多态
 此模式让算法的变化，不会影响到使用算法的客户。
 */
import UIKit

class ClassA {
    enum ClassType {
        case normal
        case returnn(CGFloat)
        case rebate(CGFloat)
    }
    var type: ClassType
    init(type: ClassType) {
        self.type = type
    }
    
    func getRusult(money: CGFloat) -> CGFloat {
        switch type {
        case .normal:
            return money
        case let .rebate(r):
            return money * r
        case let .returnn(r):
            return money - r
        }
    }
}

class StratagyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let context1 = ClassA(type: .normal)
        print(context1.getRusult(money: 100))
        
        let context2 = ClassA(type: .rebate(0.8))
        print(context2.getRusult(money: 100))
        
        let context3 = ClassA(type: .returnn(5))
        print(context3.getRusult(money: 100))
        
        let cash1 = Cash(type: .normal)
        let cash2 = Cash(type: .robate)
        let cashSuper = CashReturn(cashReturn: 10)
        let cash3 = Cash(cashSuper: cashSuper)
        
        print(cash1.getCashResult(money: 100))
        print(cash2.getCashResult(money: 100))
        print(cash3.getCashResult(money: 100))
    }
}

/// 定义一个需要变化的算法
protocol CashProtocol {
    func acceptCash(cash: CGFloat) -> CGFloat
}
/// 定义不同的类实现不同的算法
class CashNormal: CashProtocol {
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash
    }
}
class CashRobate: CashProtocol {
    var cashRobate: CGFloat
    init(robate: CGFloat) {
        cashRobate = robate
    }
    
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash * cashRobate
    }
}
class CashReturn: CashProtocol {
    var cashReturn: CGFloat
    init(cashReturn: CGFloat) {
        self.cashReturn = cashReturn
    }
    
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash - cashReturn
    }
}
/// 通过算法类对象调用协议方法完成不同的实现
class Cash {
    enum CashType {
        case normal
        case robate
        case cashReturn
    }
    
    var cashSuper: CashProtocol
    
    init(cashSuper: CashProtocol) {
        self.cashSuper = cashSuper
    }
    
    init(type: CashType) {
        switch type {
        case .normal:
            cashSuper = CashNormal()
        case .robate:
            cashSuper = CashRobate(robate: 0.8)
        case .cashReturn:
            cashSuper = CashReturn(cashReturn: 5)
        }
        
    }
    func getCashResult(money: CGFloat) -> CGFloat {
        return cashSuper.acceptCash(cash: money)
    }
}
