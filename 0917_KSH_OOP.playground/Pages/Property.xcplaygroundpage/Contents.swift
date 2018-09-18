//: [Previous](@previous)
/*:
 ---
 # Property
 ---
 */
/*:
 ## Stored Property
 
 Enumeration ❌   Structure ⭕️   Class ⭕️
 */

import Foundation

class StoredProperty {
  var width = 0.0
  var height = 0.0
}

let stored = StoredProperty()
stored.width = 123
stored.height = 456
stored.width
stored.height

/*:
 ## Lazy Stored Property
 - 등록 정보의 초기 값이 인스턴스의 초기화가 완료 될 때까지 값을 알 수 없는 외부 요인에 의존 할 때
 - 속성의 초기 값이 복잡하거나 계산 비용이 많이 드는 설정을 필요로 할 때
 - 필요한 경우가 제한적일 때
 
 Enumeration ❌   Structure ⭕️   Class ⭕️
 */
print("\n---------- [ Lazy Property ] ----------\n")  //지연 저장
//lazy의 변수가 처음 호출될 때 초기값이 할당됨
class LazyStoredProperty {
  var width = 10.0
  var height = 20.0

//  var area = self.width * self.height //초기화가 아직 안되어있기때문이다? 마무리가 되지 않은 상태에서 self를 사용할 수 없다?
  lazy var area = self.width * self.height

//  func ifStatement() {
//    if true {   // 10%
//      print(width)
//    } else {    // 90%
//      print(area)
//    }
//  }
}

let lazyStored = LazyStoredProperty()
lazyStored.area     //이거를 안해주고 54번째 부터 55번째 까지 해주면 결과가 달라짐
lazyStored.width = 30
lazyStored.area


/*:
 ## Computed Property
 
 
 ![ComputedProperty](computed.png)
 Enumeration ⭕️   Structure ⭕️   Class ⭕️
 */
print("\n---------- [ Computed Property ] ----------\n")

class ComputedProperty {
  var width = 5.0
  var height = 5.0
  
  var area: Double {
    return width * height
  }

//    var _area2: Double = 0.0
//    var area2: Double {
//        get{
//            return _area2
//        }
//        set{
//            _area2 = newValue
//        }
//    }
    
  lazy var area1 = width * height       //초기화가 lazy하게 된다는거, 처음 한번만 할당되고 초기화를 통해 값이 결정됨
}

var computed = ComputedProperty()

computed.area
computed.area1

computed.width = 10
computed.area
computed.area1      //79번째에서 이미 결정되었기 때문에 25가 나옴

computed.area1 = 50.0       //area1 값을 바꾸고 싶으면 이렇게 직접 주입시켜줄수 밖에 없음. width와 height를 바꿔서는 area1 수정 불가
computed.area1


computed.width = 20
computed.height = 20
computed.area
computed.area1

computed.area1 = 1000
computed.area1


/*:
 ## Property Observer
 
 ![property-observer](property-observer.png)
 
 Enumeration ❌   Structure ⭕️   Class ⭕️
 */
print("\n---------- [ Property Observer ] ----------\n")

class PropertyObserver {
  var width = 0.0 {
    willSet {           //willset, didset 둘중에 하나만 호출해도 됨.
      print("willSet :", width, "->", newValue)
    }
    didSet {
        print("didSet :", oldValue, "->", width)
        area = width * height
    }
  }
  
    var height = 0.0
    var area = 0.0
}

var obs = PropertyObserver()
obs.height = 456
obs.width = 123
obs.width = 456

obs.area        //문맥상, obs.height와 obs.width 순서가 매우 중요함, #135 위치가마지막에 오면 결과값은 0이 나온다

/*:
 ## Type Property
 
 Shared
 
 Lazily Initialized
 
 ![type-prop](type-prop.png)
 
 Enumeration ⭕️   Structure ⭕️   Class ⭕️
 */

print("\n---------- [ Type Property ] ----------\n")

class TypeProperty {
  static var unit: String = "cm"        //전역변수 static -> data 에 저장됨
  
  var width = 5.0
  var height = 5.0
}

let square = TypeProperty()
square.height
square.width
TypeProperty.unit   //static 이 있는건 이렇게 호출해줘야됨, square.unit 은 안됨
TypeProperty.unit = "km"
TypeProperty.unit

print("\(square.width) \(TypeProperty.unit) and \(square.height) \(TypeProperty.unit)")

//: [Next](@next)
