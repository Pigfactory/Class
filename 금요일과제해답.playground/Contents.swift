
import Foundation


/*
 2. 아래 두 클로저를 Syntax Optimization을 이용하여 코드를 최대한 줄여보기
 
 */
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}

//let someClosure: (String, String) -> Bool = { (s1, s2) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}
//
//let someClosure: (String, String) -> Bool = { (s1, s2) in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}
//
//let someClosure: (String, String) -> Bool = { (s1, s2) in
//  let isAscending: Bool = s1 > s2
//  return isAscending
//}
//
//let someClosure: (String, String) -> Bool = { (s1, s2) in
//  return s1 > s2
//}
//
//let someClosure: (String, String) -> Bool = {
//  return $0 > $1
//}
//
//let someClosure: (String, String) -> Bool = { $0 > $1 }


let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  
  for _ in values {
    count += 1
  }
  return count
}

//let otherClosure: ([Int]) -> Int = { (values) -> Int in
//  var count: Int = 0
//
//  for _ in values {
//    count += 1
//  }
//  return count
//}
//
//let otherClosure: ([Int]) -> Int = { values in
//  var count: Int = 0
//
//  for _ in values {
//    count += 1
//  }
//  return count
//}
//
//let otherClosure: ([Int]) -> Int = { values in
//  var count: Int = values.count
//  return count
//}
//
//let otherClosure: ([Int]) -> Int = { values in
//  return values.count
//}
//
//let otherClosure: ([Int]) -> Int = {
//  return $0.count
//}
//
//let otherClosure: ([Int]) -> Int = { $0.count }




/*
 
 3. 1에서 100까지 Int값으로 구성된 배열을 필터링을 하여 새 배열을 반환하는 함수를 만들고자 한다.
 Int를 하나 입력받고 Bool타입의 값을 반환하는 함수로 만들고, 함수를 호출할 때 적절한 클로저를
 넣어주어 아래와 같은 조건으로 필터링된 배열을 반환받을 수 있도록 구현
 
 - 짝수만 나오도록 필터링
 - 3의 배수만 나오도록 필터링
 */

func filter(isIncluded: (Int) -> Bool) -> [Int] {
  // 필터되지 않은 배열
  let unfilterdArray = Array(1...100)
  
  // 필터링 된 요소를 담을 배열
  var filteredArray = [Int]()
  
  for element in unfilterdArray {
    if isIncluded(element) {
      filteredArray.append(element)
    }
  }
  return filteredArray
}

// 짝수만 나오도록 필터링

//filter(isIncluded: { (element: Int) -> Bool in
//  if element % 2 == 0 {
//    return true
//  } else {
//    return false
//  }
//})

// 3의 배수만 나오도록 필터링
//filter(isIncluded: { (element: Int) -> Bool in
//  if element % 3 == 0 {
//    return true
//  } else {
//    return false
//  }
//})

/*
4. 3개의 옵셔널타입의 문자열을 입력받아 옵셔널을 추출한 뒤 3개의 문자를 하나의 문자로 합쳐 반환하는 함수
 */

func getString(str1: String?, str2: String?, str3: String?) -> String {
  let string1 = str1 ?? ""
  let string2 = str2 ?? ""
  let string3 = str3 ?? ""
  return string1 + string2 + string3
}

