//: [Previous](@previous)
/*:
 # Type Check
 */

class className {}
var anyArray: [Any] = [10, "20", 30.0]
var anyObjectArray: [AnyObject] = [className()] // obejct 한정
var intArray: [Int] = [1, 2, 3]

var num: Int = 0
var str: String = "str"

/*:
 ---
 ## 타입 확인 - type(of: )
 ---
 */
print("\n---------- [ type(of:) ] ----------\n")

//<T> (_ : T) 타입을 동적으로 받아서 할당하겠다라는 뜻, #26~28 라인 참고
func printGenericInfo<T>(_ value: T) {
  let types = type(of: value)
  print("'\(value)' of type '\(types)'")
}
printGenericInfo(2)
printGenericInfo("2")
printGenericInfo(2.0)

type(of: intArray)
type(of: anyArray)
type(of: anyObjectArray)

type(of: 1)
type(of: "111")



/*:
 ---
 ## 타입 비교 - is
 ---
 */
print("\n---------- [ is ] ----------\n")

// anyArray[0] => 10


if anyArray[0] is Int {
  print("Int")
} else {
  print("else")
}

if anyArray[0] is Int {
  print("Equal")
}

if anyArray[1] is Int {
    print("Equal")
}

if 10 is Int {
  print("Equal")
}
//비교해볼 필요도 없이 int기 때문에 에러 발생


type(of: anyArray[0])
type(of: anyArray[1])
type(of: anyArray[2])


/*:
 ---
 ## 상속 관계
 ---
 */
print("\n---------- [ Subclassing ] ----------\n")

class Human {
  var name: String = "name"
}
class Student: Human {
  var school: String = "school"
}
class UniversityStudent: Student {
  var univName: String = "Univ"
}
class Baby: Human {
  var age: Int = 1
}

let student = Student()


student is Human     //     always true
student is Student   //     always true
student is UniversityStudent   //    false
student is Baby      //     false



// Q. 아래 someArr 의 Type 은?

//let someArr: [Human] = [Human(), Student(), Baby(), UniversityStudent()]
let someArr = [Human(), Student(), Baby(), UniversityStudent()]
type(of: someArr)       //공통 부모

let babyArr = [Baby()]
type(of: babyArr)

someArr[0] is Human    //
someArr[0] is Student  //
someArr[0] is UniversityStudent  //
someArr[0] is Baby     //

someArr[1] is Human    //
someArr[1] is Student  //
someArr[1] is UniversityStudent  //
someArr[1] is Baby     //

someArr[2] is Human    //
someArr[2] is Student  //
someArr[2] is UniversityStudent  //
someArr[2] is Baby     //

someArr[3] is Human    //
someArr[3] is Student  //
someArr[3] is UniversityStudent  //
someArr[3] is Baby     //

//공통적인 속성만 사용 가능
var human: Human = Student()
type(of: human)
human.name
//human.school  에러발생


human = Baby()
//human.age  에러발생
human = UniversityStudent()


var james = Student()
james = UniversityStudent()   //
//james = Baby()    //에러발생, 공통되지 않아서
james.school




//: [Next](@next)
