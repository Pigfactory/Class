//
//  main.swift
//  AccessControl
//
//  Created by giftbot on 17/09/2018.
//  Copyright © 2018 giftbot. All rights reserved.
//

import Foundation


let internalClass = InternalClass()
print(internalClass.someProperty)

let fileprivateClass = FileprivateClass()
print(fileprivateClass.internalProperty)


//let fileprivateClass2 = FileprivateClass()
//print(fileprivateClass2.fileprivateProperty)
//error발생, fileprivateproperty는 fileprivate이기 때문에

//let privateClass = PrivateClass()
//print(privateClass.internalProperty)


