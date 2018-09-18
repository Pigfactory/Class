//: [Previous](@previous)
import UIKit
//: - - -
//: # Inheritance
//: - - -
/*:
 ## Subclassing
 
 ![subclassing](subclassing.png)
 */
print("\n---------- [ Subclassing ] ----------\n")


class Person {
    let name = "홍길동"
    let age = 20
  
    func eat() {
        print("eat")
    }
}

class Student: Person {
    let grade = 2
    
    func study() {
        print("Study")
    }
}

class UniversityStudent: Student {
    let major = "Chemistry"
  
    func goMT() {
        print("go MT")
    }
}

let kim1 = Person()
kim1.age
kim1.eat()

let kim2 = Student()
kim2.age
kim2.eat()
kim2.study()

let kim3 = UniversityStudent()
kim3.age
kim3.eat()
kim3.study()
kim3.goMT()




/*:
 ## final
 */
print("\n---------- [ Final ] ----------\n")

class Shape {
}

//final 붙여주면 더이상 상속을 하지 않겠다가 됨
final class Circle: Shape {
}

//class Oval: Circle {
//}


//: [Next](@next)
