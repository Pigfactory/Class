
import Foundation

/***************************************************
 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
 ex) 123 -> 321 , 10293 -> 39201
 ***************************************************/

func reverseDigit(num: Int) -> Int {
  var reversedNumber = 0
  var num = num
  
  while num > 0 {
    reversedNumber = reversedNumber * 10 + num % 10
    num /= 10
    print(reversedNumber)
  }
  
  return reversedNumber
}


reverseDigit(num: 123)
reverseDigit(num: 10293)
reverseDigit(num: 824)



/***************************************************
 2개의 자연수와 사칙연산(+, -, *, /) 값을 가진 하나의 enum 타입을 입력받아 해당 연산을 수행하는 함수
 enum Arithmetic {
   case addition, subtraction, multiplication, division
 }
 ***************************************************/

enum Arithmetic {
  case addition, subtraction, multiplication, division
}

func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
  switch op {
  case .addition:
    return operand1 + operand2
  case .subtraction:
    return operand1 - operand2
  case .multiplication:
    return operand1 * operand2
  case .division:
    return Int(operand1 / operand2)
  }
}

calculator(operand1: 15, operand2: 25, op: .addition)
calculator(operand1: 30, operand2: 10, op: .subtraction)
calculator(operand1: 12, operand2: 10, op: .multiplication)
calculator(operand1: 24, operand2: 6, op: .division)



/***************************************************
 정수 타입의 배열을 선언하고 해당 배열 요소 중 가장 큰 값을 반환하는 함수 만들기
 ex) [50, 23, 29, 1, 45, 39, 59, 19, 15] -> 59
 ***************************************************/

// 1)
let arr = [50, 23, 29, 1, 45, 39, 59, 19, 15]
arr.max()


// 2)
func maximumValue(in list: [Int]) -> Int {
  var maxValue = Int.min
  for number in list {
    maxValue = max(maxValue, number)
    
//    maxValue = maxValue < number ? number : maxValue
  }
  return maxValue
}

maximumValue(in: [50, 23, 29, 1, 45, 39, 59, 19, 15])
maximumValue(in: [10, 20, 30, 80, 50, 40])
maximumValue(in: [-6, -5, -4, -3, -2, -1])





/***************************************************
 정수 타입의 배열을 2개 선언하고 겹치는 숫자들로 만들어진 배열을 반환하는 함수
 ex) [1, 2, 4, 8, 9, 12, 13] , [2, 5, 6, 9, 13]  -->  [2, 9, 13]
 ***************************************************/

let firstArray = [1, 2, 4, 8, 9, 12, 13]
let secondArray = [2, 5, 6, 9, 13]

var result: [Int] = []

for i in firstArray {
  for j in secondArray {
    if i == j {
      result.append(j)
    }
  }
}

print(result)


