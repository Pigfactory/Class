//
//  SomeClass.swift
//  AccessControl
//
//  Created by giftbot on 17/09/2018.
//  Copyright © 2018 giftbot. All rights reserved.
//

import Foundation

private class PrivateClass {
  var someProperty = 10
}   //class앞의 private은 fileprivate처럼 동작됨, 주의, 함정

//class PrivateClass {
//  private var privateProperty = 20
//  var internalProperty = 20
//}

class AnotherClass1 {
//    let privateClasee = PrivateClass()  //error발생, 맨앞에 fileprivate을 붙여라뜸 뜸
 
    func someFunction() {
        let privateClass = PrivateClass()
        print(privateClass.someProperty)
    }
}
