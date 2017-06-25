//
//  StateViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/1.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit
/**
 状态模式:当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类。
 */
class Work {
    var hour = 0
    var state: State = MorningState()
    
    func writeProgram() {
        state.writeProgram(work: self)
    }
}
protocol State {
    func writeProgram(work: Work)
}
class MorningState: State {
    func writeProgram(work: Work) {
        if work.hour < 12 {
            print("上午工作，精神百倍")
        } else {
            work.state = AfternoonState()
            work.writeProgram()
        }
    }
}
class AfternoonState: State {
    func writeProgram(work: Work) {
        if work.hour < 18 {
            print("下午工作，继续努力")
        } else {
            work.state = EveningState()
            work.writeProgram()
        }
    }
}
class EveningState: State {
    func writeProgram(work: Work) {
        if work.hour < 22 {
            print("加班哦，疲累之极")
        } else {
            print("不行了，睡着了")
        }
    }
}
class StateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let worker = Work()
        for i in 8..<24 {
            worker.hour = i
            worker.writeProgram()
        }
    }

}
