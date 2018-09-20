//: [Previous](@previous)
/*:
 ---
 # Initializer 의 다른 특징들
 ---
 */

/***************************************************
 초기화 이전 단계에서 인스턴스 메서드 호출 불가
 - 다른 메서드 호출 중 초기화 되지 않은 프로퍼티를 사용할 수도 있기 때문에 컴파일 에러 발생
 ***************************************************/

//init(height: Int, xPosition: Int) {
//  self.height = height
//  someMethod()          // Error 발생, xPosition은 아직 초기화 되지 않았기 때문에 에러 발생
//  self.xPosition = xPosition
//}
//
//func someMethod() {
//  print(self.height)
//  print(self.xPosition)  //
//}




/***************************************************
 Extension Initializer
 - Extension에서는 Convenience Initializer 는 추가할 수 있어도
   Designated Initializer 는 할 수 없음
 ***************************************************/

//상속 - 수직확장
//extension - 수평확장

class Rectangle {
  var height: Int
  var xPosition: Int
  
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
}

extension Rectangle {
  // 에러 발생, designated initd은 extension에서 사용할 수 없다.
//  init(xPosition: Int) {
//    self.height = 10
//    self.xPosition = xPosition
//  }
  
  // Convenience Init 는 가능
  convenience init(height: Int) {
    self.init(height: height, xPosition: 10)
  }
}

let rect1 = Rectangle(height: 10, xPosition: 20)
let rect2 = Rectangle(height: 20)




/***************************************************
 Required Initializer
 - 상속받은 클래스에서 반드시 작성해주어야 하는 초기화 메서드가 있을 때 required 키워드 사용
 - 이 경우 서브 클래스에서는 해당 초기화 메서드를 반드시 작성해주어야 하며, override 키워드는 생략 가능
 ***************************************************/

class Animal {
  let name: String
  let age: Int
  
  init() {
    name = "Tori"
    age = 3
  }
    
    //서브클래스에 영향을 주는 부분
  required init(name: String) {
    self.name = name
    age = 3
  }
}

class Dog: Animal {
  let type: String
  init(type: String) {
    self.type = type
    super.init()
  }
  
    //부모가 요구하기때문에 반드시 작성해줘야됨
  required init(name: String) {
    self.type = "Poodle"
    super.init(name: name)
  }
}

let dog1 = Dog(type: "Poodle")
let dog2 = Dog(name: "Tori")




/***************************************************
 Deinitializer
 - 할당된 객체가 해제될 때는 deinit 메소드가 호출됨.
 ***************************************************/

//deinit {
//  // 객체 메모리 해제 시 동작할 코드
//  print("Deinitialzed")
//}


class SomeClass {
  init() {
    print("Init")
  }
  deinit {
    print("Deinit")
  }
}

//var someClass = SomeClass()


func someFunc() {
    let someClass2 = SomeClass()
    print(someClass2)
}
someFunc()



var someClass: SomeClass? = SomeClass()
someClass = nil

/*:
 ---
 ### Question
 - 어떻게 객체에 할당된 메모리를 해제시킬 수 있을까
 ---
 */



//: [Next](@next)
