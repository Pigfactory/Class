//: [Previous](@previous)
/*:
 # Type Casting
 ---
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ---
 */

import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get {
      return .white
    }
    set {
      super.color = newValue
    }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

class Circle: Shape {
  var radius = 50.0
  
  override func draw() {
    print("draw circle")
  }
}

/*:
 ---
 ## Upcasting
 ---
 */
print("\n---------- [ Upcasting ] ----------\n")

let rect = Rectangle()
type(of: rect)
rect.color
rect.cornerRadius

let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //
upcastedRect.color      //둘다 값을 가지고 있으면 rectangle꺼를 가져온다
//upcastedRect.cornerRadius //error 발생


(rect as Shape) is Shape    //
(rect as Rectangle) is Rectangle   //
(upcastedRect as Shape) is Shape   //
//(upcastedRect as Rectangle) is Rectangle   //


/*:
 ---
 ## Downcasting
 ---
 */
print("\n---------- [ Downcasting ] ----------\n")

let newRect: Shape = Rectangle()
//타입은 shape , 내용은 rectangle
newRect.color    //
//newRect.cornerRadius   //

//let downcastedRect: Rectangle = newRect //
//더 적은 내용을 더 큰 내용에 넣을 수없음??? error 발생


//let downcastedRect: Rectangle = newRect as Rectangle
//newRect는 Shape인데 자식한테 넣을려고 해서 error 발생

//let downcastedRect: Rectangle? = newRect as? Rectangle


let downcastedRect: Rectangle = newRect as! Rectangle

downcastedRect.color
downcastedRect.cornerRadius

//optional binding이기때문에 가능
if let downcastedRect = newRect as? Rectangle {
  print(downcastedRect.cornerRadius)
}



//Q. 아래 value 에 대한 Casting 결과는?
//let value = 1
//(value as Float) is Float   // error  Int랑 Float은 완전 별개다, 부모, 자식 관계 ㄴㄴ
//(value as? Float) is Float  // (value as? Float) > nil
//(value as! Float) is Float  // error


/*:
 ---
 ## Type Check Operator
 ---
 */
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()
let circle = Circle()

let list = [shape, rectangle, triangle, circle]
type(of: list)
/*:
 ---
 ### Question
 - 아래 for 문에 대한 결과는?
 ---
 */
//이럴경우마지막에 elem is shape를 넣어줘야 하나씩 프린트가 됨
for elem in list {
  if elem is Shape {
    print("shape instance")
  } else if elem is Rectangle {
    print("rect instance")
  } else if elem is Triangle {
    print("triangle instance")
  } else if elem is Circle {
    print("circle instance")
  }
}


print("\n---------- [ = ] ----------\n")

// list -> [Shape]
for element in list  {
  element.draw()
}



/***************************************************
 정리
 
 업 캐스팅
 - 상속 관계에서 수퍼 클래스로의 변환 및 자기 자신의 타입으로 변환하는 것은 반드시 수행 가능
 - 이것을 업캐스팅이라 하며 as 키워드 사용 가능
 e.g.
 let someone: Student = Student()
 let human: Human = someone as Human
 
 
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 as? 또는 as! 를 사용
 e.g.
 let someone = Student()
 let student1 = someone as? Student   // Optional(Student)
 let student2 = someone as! Student   // Student
 let baby1 = someone as? Baby         // nil
 let baby2 = someone as! Baby         // Runtime Error
 ***************************************************/


//: [Next](@next)
