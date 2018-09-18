//: [Previous](@previous)
import UIKit
//: - - -
//: # Polymorphism
//: * Overloading
//: * Overriding
//: - - -
//: ## Overloading
/***************************************************
 1. 다른 파라미터 이름
 2. 다른 파라미터 타입
 3. 다른 파라미터 개수
 ***************************************************/

print("\n---------- [ Overloading ] ----------\n")

func printParameter() {
  print("No param")
}

//func printParameter() -> String {   // Error
//  print("No param")
//}

func printParameter(param: Int) {
  print("Input :", param)
}

func printParameter(_ param: Int) {
  print("Input :", param)
}

print("=====")
printParameter()
printParameter(param: 1)
printParameter(3)


// ---------

func printParameter(param: String) {
  print("Input :", param)
}

func printParameter(_ param: String) {
  print("Input :", param)
}

func printParameter(name param: String) {
  print("Input :", param)
}

//func printParameter(param name: String) {   // Error
//  print("Input :", name)
//}


print("=====")
printParameter(param: "hello1")
printParameter("hello2")
printParameter(name: "Hello3")


/////////

func printParameter(param: String, param1: String) {
  print("Input :", param, param1)
}

func printParameter(_ param: String, _ param1: String) {
  print("Input :", param, param1)
}

func printParameter(_ param: String, param1: String) {
  print("Input :", param, param1)
}

func printParameter(param: String, _ param1: String) {
  print("Input :", param, param1)
}


print("=====")
printParameter(param: "hello", param1: "world1")
printParameter("hello", "world2")
printParameter("hello", param1: "world3")
printParameter(param: "hello", "world4")




//: ## Overriding

print("\n---------- [ Overriding ] ----------\n")

class Shape {
  final var lineWidth = 3   //lineWidth는 overide가 안됨, 상속은 되는데
  var color = UIColor.black
  var title = "Shape"
  
  init(color: UIColor) {
    self.color = color
  }
  
  func draw() {
    print("draw shape")
  }
}


let shape = Shape(color: .cyan)
shape.color
shape.draw()


print("\n---------- [ Rectangle ] ----------\n")

class Rectangle: Shape {
  var cornerRadius = 0.0
  
  init(color: UIColor, cornerRadius: Double = 10.0) {
    super.init(color: color)
    self.cornerRadius = cornerRadius
  }
}

let rect = Rectangle(color: UIColor.blue)
rect.color
rect.cornerRadius
rect.lineWidth
rect.draw()



print("\n---------- [ Triangle ] ----------\n")

class Triangle: Shape {
//  override var color: UIColor  = .green
  
//  override var color: UIColor {
//    get {
//      return super.color
//    }
//    set {
//      super.color = newValue
//    }
//  }
  
    
    //변수의 경우는 override할때 get, set으로 해주면 된다.
  override var title: String {
    get {
//      return "Triangle"
      return super.title + " => Triangle"
    }
    set {
      super.title = newValue
    }
  }
  
    //함수는 그냥 override 붙여주면 된다
  override func draw() {
    super.draw()
    print("draw triangle")
  }
}


let triangle = Triangle(color: UIColor.blue)
triangle.color
triangle.color = .yellow
triangle.color

shape.title
triangle.title      //set으로 진입
triangle.title = "ABC"      //get으로 진입

//triangle.cornerRadius     //cornerRadius는 rectangle의 값이기때문에
triangle.draw()





//: [Next](@next)
