//
//  ProxyViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/1.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit

/**
 代理模式：为其他对象提供一种代理以控制对这个对象的访问。
 */

protocol GiveGift {
    func giveDolls()
    func giveFlowers()
    func giveChocolate()
}

class SchoolGirl {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Giver: GiveGift {
    var addressee: SchoolGirl!
    func giveDolls() {
        print("give dolls to " + addressee.name)
    }
    func giveFlowers() {
        print("give flowers to " + addressee.name)
    }
    func giveChocolate() {
        print("give chocolate to " + addressee.name)
    }
}
/// 当一个类完成不了特定功能的时候，他需要找一个能完成功能的人做他的代理替他完成
class SchoolBoy {
    var proxy: Giver!
    var name: String
    init(name: String) {
        self.name = name
    }
    func giveDolls() {
        proxy.giveDolls()
    }
    func giveFlowers() {
        proxy.giveFlowers()
    }
    func giveChocolate() {
        proxy.giveChocolate()
    }
}

class ProxyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let boy = SchoolBoy(name: "xiaoming")
        let girl = SchoolGirl(name: "xiaohong")
        let proxy = Giver()
        
        boy.proxy = proxy
        boy.proxy.addressee = girl
        boy.giveDolls()
        boy.giveFlowers()
        boy.giveChocolate()
    }
}
