//
//  AnotherFile.swift
//  AccessControl
//
//  Created by giftbot on 17/09/2018.
//  Copyright © 2018 giftbot. All rights reserved.
//

import Foundation

//fileprivate class FileprivateClass {
//  var someProperty = 20
//}

class FileprivateClass {
  fileprivate var fileprivateProperty = 20
  var internalProperty = 20
}



class AnotherClass {
  func someFunction() {
    let fileprivateClass = FileprivateClass()
    print(fileprivateClass.fileprivateProperty)
  }
}
