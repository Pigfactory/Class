//: [Previous](@previous)
/*:
 # Super Class Initializing
 */
/*:
 ![Initializer](Init.png)
 */

/***************************************************
 - 서브 클래스는 자기 자신 이외에 수퍼 클래스의 저장 프로퍼티까지 초기화 해야 함
 - 수퍼 클래스의 Designated Initializer 가 기본 init 함수 하나만 있을 경우 자동으로 super.init() 이 호출됨
 ***************************************************/

print("\n---------- [ Super Class Init ] ----------\n")

class Base {
  var value: String
  var someProperty: String
    
  init() {
    value = "Base"
    someProperty = "someProperty"
  }
  
  /***************************************************
   Designated Initializer 가 하나일 때는 서브 클래스에서 수퍼클래스의 초기화 함수를 부르지 않아도 동작
   여러 개로 만들 경우 어떤 초기화 메서드를 선택해야 할지 알 수 없으므로 선택해주지 않으면 에러 발생
   이 때는, 서브 클래스의 모든 Designated Initializer 마다 수퍼 클래스의 초기화 함수를 명시적으로 선택해주어야 함.
   Convenience 는 달라질 거 없음
   ***************************************************/
  
//  init(_ value: String) {
//    self.value = value
//    self.someProperty = "someProperty"
//  }
  
  convenience init(someProperty: String) {
    self.init()
    self.someProperty = someProperty
  }
}


class Rectangle: Base {
  var width: Int = 20
  var height: Int
  var xPosition: Int
  
  override init() {
    height = 10
    xPosition = 5
  }
  
  init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
  
  convenience init(height: Int) {
    self.init(height: height, xPosition: 10)
  }
}



print("\n---------- [ Override Init ] ----------\n")

class Human {
  var name: String
  
  init() {
    self.name = "James"
  }
  init(name: String) {
    self.name = name
  }
}


class Student: Human {
  var school: String
  
  init(school: String) {
    self.school = school    //1. 자신을 먼저 초기화 시켜줘야한다.
    //    super.init(name: "name")
    super.init()    //2. 자신먼저 초기화 -> 부모 초기화
  }
  
  override init() {
    //  override init(name: String) {
    //    school = "High School"
    self.school = "High School"
    super.init(name: "name")
  }
  
  convenience override init(name: String) {
//        print(self.school) //에러발생, 초기화후 진행해야됨, 맨 아래로 보내면 가능
    //    self.school = ""  //이것도 마찬가지, 초기화가 아직 안되서 에러, 맨아래 ㄲ
    self.init(school: "")
    //    self.school = "school"
  }
}

let student = Student(school: "High School")
student.school
student.name




/*:
 ---
 ### Question
 - 자식 클래스를 먼저 초기화하고 부모 클래스 초기화 메서드를 나중에 호출해야 하는 이유는?
 ---
 */

print("\n---------- [ Self Init First ] ----------\n")

class Shape {
  var name: String
  var sides: Int
  
  init(sides: Int, named: String) {
    self.sides = sides
    self.name = named
    printShapeDescription()
  }
  
  func printShapeDescription() {
    print("Shape Name : \(self.name)")
    print("Sides : \(self.sides)")
  }
}


class Triangle: Shape {
  var hypotenuse: Int
  
  init(hypotenuse: Int) {
    self.hypotenuse = hypotenuse
    super.init(sides: 3, named: "Triangle")
  }
  
  override func printShapeDescription() {
    print("Hypotenuse : \(self.hypotenuse)")
  }
}

let triangle = Triangle(hypotenuse: 12)






/***************************************************
 자신의 프로퍼티를 초기화 하지 않은 상태로 부모 클래스의 초기화 메서드를 호출했을 경우
 초기화되지 않은 프로퍼티를 사용하게 되는 일이 발생 할 수 있음.
 
 위 코드에서는 부모클래스의 init 메서드에서 printShapeDescription() 을 호출하고 있지만
 실제 실행되는 메서드는 그것을 호출한 객체의 override 된 메서드가 실행되는 것을 확인 가능
 ***************************************************/


//: [Next](@next)
