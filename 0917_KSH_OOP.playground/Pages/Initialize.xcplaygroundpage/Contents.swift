//: [Previous](@previous)
/*:
 ---
 ## Class Initialize
 ---
 */
/*:
 ---
 ### Class 의 초기화 메서드
 - 초기화 메서드(init)가 필수가 아닌 경우 : 모든 저장 프로퍼티에 (Stored Properties) 초기값이 설정됨
 - 초기화 메서드(init)가 필수인 경우 : 저장 프로퍼티 중 하나 이상이 초기값 미설정됨
 ---
 */

/***************************************************
 초기화 함수가 필수가 아닌 경우 - 모든 저장 프로퍼티 (Stored Properties) 에 초기값 설정
 단순히 ClassName()으로 생성 가능
 ***************************************************/

class Dog1 {
  let name = "Tori"     //저장 프로퍼티
  let color = "Brown"
  
  func bowwow() {
    print("Dog1 Bowwow!")
  }
}

let tori = Dog1()
tori.bowwow()


/***************************************************
 초기화 함수가 필요한 경우 - 저장 프로퍼티 중 하나 이상이 초기값 미설정
 
 ==> init 메서드를 통해 설정
 ***************************************************/

// 파라미터 없는 경우

class Dog2 {
  let name: String
  let color: String
  
//저장 프로퍼티가 없을 경우 반드시 init을 시켜줘야 한다 ㅇㅇ
  init() {
    name = "Tori"
    color = "Brown"
  }
  
  func bowwow() {
    print("Dog2 Bowwow!")
  }
}

let tori2 = Dog2()
//let tori2 = Dog2.init()   위에 줄과 동일한 뜻
tori2.bowwow()



// 파라미터를 통해 설정하는 경우

class Dog3 {
  let name: String
  let color: String

  init() {
    name = "Tori"
    color = "Brown"
  }
  init(name: String) {      //이름만 초기화 시켜줄때 사용하면됨
    self.name = name
    color = "Brown"
  }
  init(name: String, color: String) {
    self.name = name
    self.color = color
  }
  
  func bowwow() {
    print("Dog3 Bowwow!")
  }
}

//let tori2 = Dog2()
var tori3 = Dog3()      //self는 자기자신이 등록되어있는 메모리 공간안(Dog3())을 얘기
var tori4 = Dog3(name: "chichi")
var tori5 = Dog3(name: "chewchew", color: "Red")

tori3.name
tori3.color

tori4.name
tori4.color

tori5.name
tori5.color


//: [Next](@next)
