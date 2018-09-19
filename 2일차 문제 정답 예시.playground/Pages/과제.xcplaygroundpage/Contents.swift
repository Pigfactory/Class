
import Foundation



/***************************************************
 자연수 하나를 입력받아 그 수의 약수를 모두 출력하는 함수
 ***************************************************/
func printDivisors(of number: Int) {
  for i in 1...number {
    if number % i == 0 {
      print(i, terminator: " ")
    }
  }
  print()
}

printDivisors(of: 14)
printDivisors(of: 19)
printDivisors(of: 20)


/***************************************************
 2 이상의 자연수를 입력받아, 소수인지 아닌지 판별하는 함수
 ***************************************************/

func isPrimeNumber(_ number: Int) -> Bool {
  guard number > 1 else { return false }
  guard number != 2 else { return true }
  
  for i in 2..<number {
    if number % i == 0 {
      return false
    }
  }
  return true
}

isPrimeNumber(15)
isPrimeNumber(33)
isPrimeNumber(94)

isPrimeNumber(2)
isPrimeNumber(17)
isPrimeNumber(23)



/***************************************************
 자연수를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
 - 입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.
 - 참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
 ***************************************************/

func fibonacciNumber(at index: Int) -> Int {
  var op1 = 0, op2 = 1
  
  for i in 0..<index {
    if i % 2 == 0 {
      op1 += op2
    } else {
      op2 += op1
    }
  }
  
  return index % 2 == 0 ? op1 : op2
}

fibonacciNumber(at: 0)
fibonacciNumber(at: 1)
fibonacciNumber(at: 2)
fibonacciNumber(at: 3)
fibonacciNumber(at: 4)
fibonacciNumber(at: 5)
fibonacciNumber(at: 6)
