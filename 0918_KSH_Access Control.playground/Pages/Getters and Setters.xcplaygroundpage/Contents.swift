//: [Previous](@previous)
//: - - -
//: # Getters and Setters
//: - - -
/***************************************************
 Getter 와 Setter 는 그것이 속하는 변수, 상수 등에 대해 동일한 접근 레벨을 가짐
 이 때 Getter 와 Setter 에 대해서 각각 다른 접근 제한자 설정 가능
 ***************************************************/

/***************************************************
 Setter 설정
 ***************************************************/

class TrackedString {
//  var numberOfEdits = 0
//  public(set) var numberOfEdits = 0
//  public(set)의 경우는 큰 의미가 없다. 어차피 어디서나 다 접근가능하고 설정가능하기 때문이다.
//  에러발생 이유는 class가 interval이기 때문에 더 높은 public 사용이 불가
  private(set) var numberOfEdits = 0
    //getter internal이 생략 되어 있음, class의 기본값(default) 가 internal이기 때문에 = 값을 가져오는건 가능, set은 불가
    //public(get) = get은 public으로 하겠다. / private(set) = set은 private으로 하겠다. ***
  var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
}


let trackedString = TrackedString()
trackedString.numberOfEdits     //(set)으로 설정해주면 단순히 읽어오는 기능은 할수 있다. #17 private(set)
trackedString.value = "This string will be tracked."
trackedString.numberOfEdits
//trackedString.numberOfEdits = 2   //(set)으로 설정해주면 읽어오는것만 되고 값 설정은 안된다. #17 private(set)
trackedString.value += " This edit will increment numberOfEdits."
trackedString.numberOfEdits
//trackedString.numberOfEdits = 3
trackedString.value = "value changed"
trackedString.numberOfEdits



/***************************************************
 Getter 와 Setter 에 대해 각각 명시적으로 표현
 ***************************************************/

public class TrackedString1 {
  public private(set) var numberOfEdits = 0     //getter는 public으로, setter는 private으로, getter는 public class를 따라가기 때문에 굳이 쓰지는 않음
  
  public var value: String = "" {
    didSet {
      numberOfEdits += 1
    }
  }
  
  public init() {}
}

//: [Next](@next)
