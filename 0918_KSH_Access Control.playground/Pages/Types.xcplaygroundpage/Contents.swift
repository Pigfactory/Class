//: [Previous](@previous)
/*:
 ---
 # Types
  ---
 */
/*:
 ---
 ## Tuple
 ---
 */

/***************************************************
 Tuple 유형의 접근 수준은 자동으로 추론되며 명시적으로 지정 불가능
 튜플 유형에 대한 엑세스 수준은 해당 튜플에 사용된 모든 유형 중 가장 제한적인 엑세스 수준에 맞춰지게 됨
 ***************************************************/

internal class SomeInternalClass {}
private class SomePrivateClass {}

//에러발생이유는 보다 낮은 범위로 적용되기 때문에, 따라서 private이나 fileprivate으로 설정해줘야됨
//func returnTupleFunction() -> (SomeInternalClass, SomePrivateClass) {
//  return (SomeInternalClass(), SomePrivateClass())
//}



/*:
 ---
 ## Enumeration Types
 ---
 */

/***************************************************
 아래 두 개의 차이는?
 ***************************************************/

private enum 방위 {   //이때 private = fileprivate, 그래서 아래 #51에서 쓸수있다.
  case 동, 서, 남, 북
}

//별개의 case로 구분 불가능
//enum 방위 {
//  private case 동
//  private case 서
//  private case 남
//  private case 북
//}


fileprivate let enumeration = 방위.남
switch enumeration {
case .동, .서:
  print("좌우")
case .남, .북:
  print("상하")
}


/*:
 ---
 ## Nested Types
 Access Control Syntax 의 Custom Types 참고
 * Private  ->  Private
 * Fileprivate  ->  Fileprivate
 * Internal  ->  Internal
 * Public  ->  Internal
 * Open  ->  Internal
 ---
 */


/*:
 ---
 ## Type Aliases
 ---
 */

class AliasClass {
  let someProperty = 1
}

//public typealias Typealiases = AliasClass
//default 값이 internal 보다 큰 public은 불가

internal typealias Typealiases1 = AliasClass

fileprivate typealias Typealiases2 = AliasClass
//낮은 레벨은 가능

fileprivate let aliasesInstance = Typealiases1()
aliasesInstance.someProperty




//: [Next](@next)
