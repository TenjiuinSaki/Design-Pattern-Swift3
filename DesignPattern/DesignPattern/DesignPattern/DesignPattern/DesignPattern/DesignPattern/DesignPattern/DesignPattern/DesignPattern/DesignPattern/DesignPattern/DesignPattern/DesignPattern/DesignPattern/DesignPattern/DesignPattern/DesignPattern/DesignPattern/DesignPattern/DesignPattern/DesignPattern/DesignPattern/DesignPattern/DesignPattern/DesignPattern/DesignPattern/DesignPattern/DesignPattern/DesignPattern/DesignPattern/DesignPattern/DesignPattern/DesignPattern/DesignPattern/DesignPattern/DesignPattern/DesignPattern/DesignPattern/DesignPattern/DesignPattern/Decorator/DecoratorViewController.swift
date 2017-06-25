//
//  DecoratorViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/1.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit

/**
 装饰模式：动态地给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更为灵活。
 */

class DecoratorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let iphone = Phone()
        print(iphone.callNumber())
        print(iphone.sendMessage())
        
        let GPS = DecotatorGPS(phone: iphone)
        print(GPS.callNumber())
        print(GPS.sendMessage())
        
        let bluetooth = DecotatorBluetooth(phone: GPS)
        print(bluetooth.callNumber())
        print(bluetooth.sendMessage())
    }


}

class Phone {
    func callNumber() -> String {
        return "iphone call somebody"
    }
    func sendMessage() -> String {
        return "iphone send message"
    }
}
/// 核心思想：通过装饰器的子类为父类及其子类添加各种功能而不需改变被修饰者
class Decotator: Phone {
    var cellPhone: Phone
    init(phone: Phone) {
        cellPhone = phone
    }
}

class DecotatorGPS: Decotator {
    override func callNumber() -> String {
        return cellPhone.callNumber() + " GPS"
    }
}

class DecotatorBluetooth: Decotator {
    override func callNumber() -> String {
        return cellPhone.callNumber() + " bluetooth"
    }
    
    override func sendMessage() -> String {
        return cellPhone.sendMessage() + " bluetooth"
    }
}
