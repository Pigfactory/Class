//: [Previous](@previous)
/*:
 # Control Transfer Statement
 - 특정 코드에서 다른 코드로 제어를 이전하여 코드 실행 순서를 변경하는 것
 - Swift 에는 5가지 키워드 사용
   - continue
   - return
   - break
   - fallthrough
   - throw
 */


print("---------- [ continue ] ----------\n")

for num in 0...15 {
  if num % 2 == 0 {
    continue
  }
  print(num)
}



print("\n---------- [ return ] ----------\n")

func isEven(num: Int) -> Bool {
  if num % 2 == 0 {
    return true
  }
  return false
}

isEven(num: 1) // false
isEven(num: 2) // true


func returnFunction() -> Int {
  var sum = 0
  
  for _ in 1...100 {
    sum += 20
    return sum   //반복문을 끝내는게 아니라 함수(func)를 종료시킴, 함수가 없는데서 사용하면 에러 발생
    return 5
  }
  return 7
}

print(returnFunction())


print("\n---------- [ break 1 ] ----------\n")

for num in 0...8 {
  if num % 2 == 0 {
    break   //break는 반복문을 바로 빠져나가버리기 때문에 print를 거치지 않음, 따라서 결과는 아무것도 나타나지 않음
  }
  print(num)
}

print("\n---------- [ break 2 ] ----------\n")

for i in 0...3 {
  for j in 0...3 {
    if i > 1 {
      break
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}

/*:
 ---
 ## Labeled Statements
 ---
 */
print("\n---------- [ labeled ] ----------\n")

OUTER: for i in 0 ... 3 {
  INNER: for j in 0...3 {
    if i > 1 {
      print("j :", j)
      continue INNER
//      break OUTER  // continue를 지우고 break를 활성시키면 OUTER를 break해버리므로 j가 2, 3 일때를 작동하지 않음
    }
    print("  inner \(j)")
  }
  print("outer \(i)")
}


//: [Next](@next)
