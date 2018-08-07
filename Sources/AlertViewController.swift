//
//  AlertViewController.swift
//  B7iOSBuyer
//
//  Created by linhey on 2018/4/28.
//  Copyright © 2018年 com.spzjs.b7iosbuy. All rights reserved.
//

import UIKit
import Then
import SnapKit
import FHXColorAndFont
import FHXKit

public class AlertViewController: UIViewController {
  
  let contentView = UIView().then { (item) in
    item.backgroundColor = Color.white
    item.layer.cornerRadius = 6
    item.layer.masksToBounds = true
  }
  
  let closeControl = UIControl().then { (item) in
    item.backgroundColor = Color.black.withAlphaComponent(0.5)
  }
  
  let titleLabel = UILabel().then { (item) in
    item.font = Font.font17
    item.textColor = Color.textBlack
    item.textAlignment = .center
  }
  
  let textLabel = UILabel().then { (item) in
    item.font = Font.font14
    item.textColor = Color.textBlack
    item.textAlignment = .center
    item.numberOfLines = 0
  }
  
  let doneBtn = UIButton(type: .custom).then { (item) in
    item.setTitle("确定", for: .normal)
    item.setTitleColor(Color.white, for: .normal)
    item.titleLabel?.font = Font.font17
    item.setBackgroundColor(color: Color.theme, for: .normal)
  }
  
  let cancelBtn = UIButton(type: .custom).then { (item) in
    item.setTitle("取消", for: UIControlState.normal)
    item.setTitleColor(Color.textBlack, for: UIControlState.normal)
    item.titleLabel?.font = Font.font17
  }
  
  private let line = UIView().then { (item) in
    item.backgroundColor = Color.line
  }
  
  public convenience init(title: String, doneEvent: @escaping (()->())) {
    self.init(title: title, doneEvent: doneEvent, cacelEvent: {})
  }
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  public init(title: String,
       text: String = "",
       doneEvent: (()->())?,
       cacelEvent: (()->())?) {
    super.init(nibName: nil, bundle: nil)
    modalTransitionStyle = .crossDissolve
    modalPresentationStyle = .overCurrentContext
    self.titleLabel.text = title
    self.textLabel.text = text
    self.doneBtn.add(for: .touchUpInside, action: {
      self.dismiss(animated: true, completion: {
        doneEvent?()
      })
    })
    self.cancelBtn.add(for: .touchUpInside, action: {
      self.dismiss(animated: true, completion: {
        cacelEvent?()
      })
    })
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override public func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Color.clear
    
    closeControl.add(for: UIControlEvents.touchUpInside) {
      self.dismiss(animated: true, completion: nil)
    }
    
    view.addSubview(closeControl)
    view.addSubview(contentView)
    contentView.addSubview(titleLabel)
    contentView.addSubview(textLabel)
    contentView.addSubview(doneBtn)
    contentView.addSubview(cancelBtn)
    contentView.addSubview(line)
    
    closeControl.snp.makeConstraints { (make) in
      make.top.right.left.bottom.equalToSuperview()
    }
    
    contentView.snp.makeConstraints { (item) in
      item.left.equalToSuperview().offset(15)
      item.right.equalToSuperview().offset(-15)
      item.centerY.equalToSuperview().offset(-10)
    }
    
    titleLabel.snp.makeConstraints { (make) in
      make.top.equalToSuperview().offset(25)
      make.right.equalToSuperview().offset(-10)
      make.left.equalToSuperview().offset(10)
    }
    
    textLabel.snp.makeConstraints { (make) in
      make.top.equalTo(titleLabel.snp.bottom).offset(10)
      make.right.equalToSuperview().offset(-10)
      make.left.equalToSuperview().offset(10)
    }
    
    line.snp.makeConstraints { (make) in
      make.height.equalTo(1)
      make.right.left.equalToSuperview()
      make.top.equalTo(textLabel.snp.bottom).offset(25)
    }
    
    doneBtn.snp.makeConstraints { (make) in
      make.top.equalTo(line.snp.bottom)
      make.bottom.right.equalToSuperview()
      make.height.equalTo(50)
      make.left.equalTo(self.contentView.snp.centerX)
    }
    
    cancelBtn.snp.makeConstraints { (make) in
      make.bottom.left.equalToSuperview()
      make.height.equalTo(50)
      make.right.equalTo(self.contentView.snp.centerX)
    }
  }
  
}


