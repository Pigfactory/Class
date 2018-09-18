//: [Previous](@previous)
/*:
 ---
 ## Access Levels
 * open
 * public
 * internal
 * fileprivate
 * private
 ---
 */

/***************************************************
 Open / Public
 ***************************************************/   //오픈소스를 만들지 않을꺼면 크게 상관없음

class SomeOpenClass {
  open var name = "name"    //일반 var name = "" 과 동일하다
  open var age = 0          //open대신 개별적으로 private이나 public 지정가능, internal, fileprivate 등등
}

class SomePublicClass {
  public var name = "name"
  public var age = 0
}

let someOpenClass = SomeOpenClass()
someOpenClass.name
someOpenClass.age

let somePublicClass = SomePublicClass()
somePublicClass.name
somePublicClass.age

//: ---
/***************************************************
 Internal
 ***************************************************/    //이게 default값

class SomeInternalClass {
  internal var name = "name"    //internal을 쓰나 안쓰나 차이없음
  internal var age = 0
}

//class SomeInternalClass {
//  var name = "name"
//  var age = 0
//}


let someInternalClass = SomeInternalClass()
someInternalClass.name
someInternalClass.age

//: ---
/***************************************************
 fileprivate
 ***************************************************/

class SomeFileprivateClass {
  fileprivate var name = "name"
  fileprivate var age = 0
}

let someFileprivateClass = SomeFileprivateClass()
someFileprivateClass.name
someFileprivateClass.age


//: ---

class SomePrivateClass {
    private var name = "name"
    private var age = 0
    func someFunction(){
        print(name)
    }
}

let somePrivateClass = SomePrivateClass()
somePrivateClass.someFunction()     //이건 가능

//somePrivateClass.name
//somePrivateClass.age



/***************************************************
 1. Command Line Tool 로 체크
 2. UIViewController, Int 등 애플 프레임워크의 접근 제한자 확인
 ***************************************************/





//: [Next](@next)
