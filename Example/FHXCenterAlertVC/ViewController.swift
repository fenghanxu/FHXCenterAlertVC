//
//  ViewController.swift
//  FHXCenterAlertVC
//
//  Created by fenghanxu on 08/07/2018.
//  Copyright (c) 2018 fenghanxu. All rights reserved.
//

import UIKit
import FHXCenterAlertVC

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let btn = UIButton()
      btn.backgroundColor = UIColor.blue
      btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
      btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
      view.addSubview(btn)
      
    }

  @objc func btnClick(){
    let vc = AlertViewController(title: "确定删除我的评论?", doneEvent: {
      //编写删除的内容
    })
    self.present(vc, animated: true, completion: nil)
  }
  
}

