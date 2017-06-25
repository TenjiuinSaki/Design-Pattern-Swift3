//
//  AbstractFactoryViewController.swift
//  DesignPattern
//
//  Created by HKMac on 2017/6/1.
//  Copyright © 2017年 张玉飞. All rights reserved.
//

import UIKit

class AbstractFactoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let factory = SqlserverFactory()
        let user = factory.createUser()
        user.insertUser(user: User())
        print(user.getUser())
    }

}

class User {
    
}
class Department {
    
}
protocol UserProtocal {
    func insertUser(user: User)
    func getUser() -> User
}
class SqlserverUser: UserProtocal {
    func getUser() -> User {
        print("获取SQL SERVER用户")
        return User()
    }
    func insertUser(user: User) {
        print("插入SQL SERVER用户")
    }
}
protocol Factory {
    func createUser() -> UserProtocal
//    func createDepartment() -> Department
}
class SqlserverFactory: Factory {
    func createUser() -> UserProtocal {
        return SqlserverUser()
    }
    
}
