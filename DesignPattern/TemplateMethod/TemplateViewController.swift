//
//  TemplateViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/1.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit

class Template {
    func question() {
        print("问题1：模板方法是？")
        print("答案：" + answer())
    }
    func answer() -> String {
        return ""
    }
}
class Paper: Template {
    override func answer() -> String {
        return "定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。"
    }
}
class TemplateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let paper = Paper()
        paper.question()
        
    }

}
