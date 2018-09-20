//: [Previous](@previous)
/*:
 # Initializer
 ---
 * Swift 의 객체는 사용하기 전 모든 저장 프로퍼티에 대해 초기화 필수
 * 다음 3 가지 중 하나를 택해 설정
   * 초기값 지정
   * 옵셔널 - nil 값으로 초기화
   * 초기값이 없고, 옵셔널 타입이 아닌 프로퍼티
 ---
 */

class Rectangle {
  var value: String?
  var width: Int = 20
  var height: Int
  var xPosition: Int

    init() {
      height = 10
      xPosition = 5
    }

    
    init(height: Int, xPosition: Int) {
        self.height = height
        self.xPosition = xPosition
    }
}




/*:
 ---
 ## Designated Initializer
 - 클래스에 반드시 1개 이상 필요
 - 초기화가 필요한 모든 프로퍼티를 단독으로 초기화 가능한 Initializer
 - 위에서 사용한 init(), init(height: Int, xPosition: Int) 가 여기에 해당
 - 초기화 과정 중 반드시 한 번은 호출
 ---
 */


/*:
 ---
 ## Convenience Initializer
 - 단독으로 모두 초기화할 수 없고 일부 프로퍼티만 처리한 뒤 다른 Initializer 에게 나머지 부분 위임
 - 중복되는 초기화 코드 방지를 위해 사용
 ---
 */

class Rectangle1 {
  var value: String?
  var height: Int
  var xPosition: Int
  
  init() {
    height = 1
    xPosition = 10
  }
  
    init(height: Int, xPosition: Int) {
    self.height = height
    self.xPosition = xPosition
  }
  
  // 일부 값만을 파라미터로 받을 때
  
  init(height: Int) {
    self.height = height
    xPosition = 10

//    자기 자신의 초기화 메서드 호출
//    self.init(height: height, xPosition: 10)
  }
//
//  convenience init(height: Int) {
//    self.init(xPosition: 20)
//    self.height = height
//  }
//
//  convenience init(xPosition: Int) {
//    self.init()
//    self.xPosition = xPosition
//  }
//
//  convenience init(height: Int) {
//    self.init()
//    self.height = height
//  }
}

let rect = Rectangle1(height: 0, xPosition: 10)
print(rect)

//let rect = Rectangle1(height: 20)


/***************************************************
 초기화 과정은 Convenience -> Convenience -> ... -> Designated (최종) 순서로 동작
 ***************************************************/
// Designated -> Designated (X)


/*:
 ---
 ## Failable Initializer
 - 객체 생성시 원하는 초기화 값이 들어오지 않거나 조건에 맞지 않을 때 객체를 생성하지 않도록 하는 것
 - 옵셔널 값을 반환하게 되며 객체 생성 실패시에는 nil 을 반환
 ---
 */
class Rectangle2 {
  let height: Int
  let xPosition: Int
  
  init?(height: Int, xPosition: Int) {
    guard height > 0 else { return nil }
    self.height = height
    self.xPosition = xPosition
  }
}

//Failable Initializer
if let rect = Rectangle2(height: 20, xPosition: 20) {
  print(rect)
}

if let rect = Rectangle2(height: -5, xPosition: 20) {
  print(rect)
} else {
  print("Failed")
}

//: [Next](@next)
