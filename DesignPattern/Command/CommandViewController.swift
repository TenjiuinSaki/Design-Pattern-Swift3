//
//  CommandViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/2.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit
/// 抽象命令（声明执行方法）
class Order {
    var orderName: String
    init(name: String) {
        orderName = name
    }
    func executeOrder() {}
}
/// 接收者（真正执行命令的对象）
class Worker {
    static let share = Worker()
    private init() {}
    func doMotton(work: String) {
        print("烤羊肉" + work)
    }
    func doChicken(work: String) {
        print("烤鸡肉" + work)
    }
}
/// 具体命令（实现执行方法）
class MuttonOrder: Order {
    override func executeOrder() {
        Worker.share.doMotton(work: orderName)
    }
}
class ChickenOrder: Order {
    override func executeOrder() {
        Worker.share.doChicken(work: orderName)
    }
}
enum OrderType: String {
    case mutton = "羊肉串"
    case chicken = "鸡肉串"
    
    func orderByNum(num: Int) -> Order {
        switch self {
        case .mutton:
            return MuttonOrder(name: rawValue + String(num))
        case .chicken:
            return ChickenOrder(name: rawValue + String(num))
        }
    }
}
/// 客户端（创建命令）
class Customer {
    func pushOrder(num: Int, type: OrderType) -> Order {
        return type.orderByNum(num: num)
    }
}
/// 调用者（要求命令对象执行请求）
class Waiter {
    var orderList = [Order]()
    func addOrder(order: Order) {
        orderList.append(order)
    }
    func notifyOrder() {
        for order in orderList {
            order.executeOrder()
        }
    }
}

class CommandViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let waiter = Waiter()
        let customer = Customer()
        waiter.addOrder(order: customer.pushOrder(num: 5, type: .mutton))
        let customer2 = Customer()
        waiter.addOrder(order: customer2.pushOrder(num: 2, type: .chicken))
        waiter.notifyOrder()
    }

}
