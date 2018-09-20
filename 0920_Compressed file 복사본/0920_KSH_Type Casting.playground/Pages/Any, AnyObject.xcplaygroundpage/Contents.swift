//: [Previous](@previous)
/*:
 ---
 # Any , AnyObject
 ---
 */

var intArr: [Int] = [1, 2, 3, 4, 5, 6]
//intArr.append("string")

var strArr: [String] = ["1", "2", "3", "4", "5"]
//strArr.append(1)

/***************************************************
 Swift 는 Int, String 등의 타입 확정 이후 다른 타입의 값은 비허용하지만 가변 타입도 함께 제공
 Any - 모든 타입
 AnyObject - 모든 레퍼런스 타입
 Any > AnyObject
 ***************************************************/

class SomeClass {}
class AnotherClass {}

var anyObjectArray: [AnyObject]
var anyArray: [Any]

anyObjectArray = [SomeClass(), AnotherClass()]
anyArray = [0, "str", true, 9.9, SomeClass()]

//anyArray.append("newElement")    //
//anyObject.append("newElement")   //

//type(of: anyArray[0])
//type(of: anyObjectArray[0])


//Q. 아래 각 라인의 결과는?
//var num: Int = anyArray[0]    // any type이기 때문에 error, type을 찍으면 int지만
//var num1: Int = anyArray[0] as Int   //
//var num2: Int = anyArray[0] as? Int  // error를 막기 위해서는 Int? 이거나 Int를 지우면 됨
//var num3: Int = anyArray[0] as! Int  //



/*:
 ---
 ## Any Type Casting
 ---
 */

// String 타입의 배열을 사용할 때

type(of: strArr[0])
strArr[0]
strArr[0].count


// Any 타입의 배열을 사용할 때

type(of: anyArray[0])
type(of: anyArray[1])
anyArray[0]
anyArray[1]


// anyArray[0].count   //   anytype이기때문에 count는 불가, int는 count 불가
// anyArray[1].count   //
// (anyArray[1] as? String)?.count




//: [Next](@next)
