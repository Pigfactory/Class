//: [Previous](@previous)
import Foundation

/*:
 ---
 ## Array
 - Ordered Collection
 - Zero-based Integer Index
 ---
 */
var arr = [1,2,3,4]
arr[0]
/*:
 ### Mutable, Immutable
 */
var variableArrayOri: Array<Int> = [ ]
var variableArrayOri2: [Int] = []
//원래 풀네임
var variableArray = [1, 2]
variableArray = []

let constantArray = [1, 2]
//constantArray = [] error 발생

// let emptyArrary = []  error발생, 타입을 지정해주지 않아서, []안에 아무것도 없어서 타입추론도 불가

var all: [Any] = [1,2,"3"] //혼용해서 넣고 싶으면 any로 타입 지정해줘야함, 아니면 error 발생


/*:
 ### Array Type
 */

var arrayFromLiteral = [1, 2, 3]
arrayFromLiteral = []

//let emptyArray = []

//let emptyArray: [String] = []

/*:
 ### Initialize
 */

let strArray1: Array<String> = ["apple", "orange", "melon"]

let strArray2: [String] = ["apple", "orange", "melon"]

let strArray3 = ["apple", "orange", "melon"]

let strArray4 = Array<String>(repeating: "iOS", count: 5)

//let strArray5 = ["apple", 3.14, 1]

/*:
 ### Number of Elements
 */
let fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count

if !fruits.isEmpty {
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}


/*:
 ### Retrieve an Element
 - [Int]
 - [Array.Index]
 - [a...b]
 - [a..<b]
 */
//              0        1         2
//fruits = ["Apple", "Orange", "Banana"]

fruits[0]
fruits[2]
//fruits[123] error 발생

fruits.startIndex
fruits.endIndex


fruits[fruits.startIndex]
fruits[fruits.endIndex - 1]


fruits.startIndex == 0    //
fruits.endIndex - 1 == 2  //

// "11".startIndex == 0

/*:
 ### Searching
 */
print("\n---------- [ Searching ] ----------\n")

let alphabet = ["A", "B", "C", "D", "E"]

if alphabet.contains("A") {
  print("contains A")
}

if alphabet.contains(where: { str -> Bool in
  // code...
  return str == "A"
}) {
  print("contains A")
}

if let index = alphabet.index(of: "D") {
  print("index of D: \(index)")
} //이것도 optional로 됨
//아래 예들

//let idx1 = alphabet.index(of: "D")
//print(idx1)
//let idx2 = alphabet.index(of: "Q")
//print(idx2)
//alphabet[idx]


/*:
 ### Add a new Element
 */
//초기화 시키기
//var alphabetArray: Array<String> = []
//var alphabetArray: [String] = []
//var alphabetArray = [String]()
var alphabetArray = ["A"]

alphabetArray.append("B")
//alphabetArray.append(1)   error

alphabetArray += ["C"]

var alphabetArray2 = ["Q", "W", "E"]
alphabetArray + alphabetArray2

alphabetArray.insert("S", at: 0)
alphabetArray.insert("F", at: 3)


/*:
 ### Change an Existing Element
 */

alphabetArray = ["A", "B", "C"]
alphabetArray[0]

alphabetArray[0] = "Z"
alphabetArray

alphabetArray = ["A", "B", "C"]
alphabetArray[alphabetArray.startIndex ..< alphabetArray.endIndex.advanced(by: -1)] = ["X", "Y"]
//advanced(by: int) 는 int 만큼 계산해줌 +3, -1 등등
//0..<2 위의 경우 이렇게 계산
alphabetArray   //C는 남아있다는게 함정
alphabetArray[0..<2] = ["K", "U"]
alphabetArray



1...5
1..<5
1...

alphabetArray = ["A", "B", "C", "D", "E", "F"]
alphabetArray[2...] = ["Q", "W", "E", "R"]  //2부터 끝까지로 해석(무한대가 아니고)
alphabetArray

alphabetArray[2...] = ["Q", "W"]
alphabetArray  //뒤에꺼는 지워지는게 함정



/*:
 ### Remove an Element
 */

alphabetArray = ["A", "B", "C", "D", "E"]
let removed = alphabetArray.remove(at: 0)

removed
alphabetArray

alphabetArray.removeAll() //최소 크기로 메모리 삭제
alphabetArray.removeAll(keepingCapacity: true)  //저장 메모리 공간 유지
//아주 큰 내용을 지웠다가 다시 작성하는 경우에 이 방법이 좋음
//컴퓨터 성능이 구릴때는 이런거를 신경써줬는데 지금은 그닥... 무시해도 됨


// index 찾아 지우기

alphabetArray = ["A", "B", "C", "D", "E"]

let indexC = alphabetArray.index(of: "C")
alphabetArray.remove(at: indexC!)  //Q>왜 !를 붙여줘야하나?
alphabetArray


/*:
 ### Sorting
 */

alphabetArray = ["A", "B", "C", "D", "E"]

//버전4.2전에는 랜덤 생성하려면 아래 코드를 사용해야함
for i in 0 ..< (alphabetArray.count - 1) {
    let j = Int(arc4random_uniform(UInt32(alphabetArray.count))) //해석: 0...4 까지 랜덤
  alphabetArray.swapAt(i, j)
}
alphabetArray


// sorted vs sort

//public func sorted() -> [Element]
//public mutating func sort()

var sortedArray = alphabetArray.sorted()
sortedArray
alphabetArray

alphabetArray.sort()
alphabetArray


// sort by closure syntax

sortedArray = alphabetArray.sorted { $0 > $1 }
//alphabetArray.sorte { (lsh, rsh) -> Bool in return lsh < rhs}

alphabetArray.sorted(by: >= )
sortedArray


alphabetArray.sort { $0 > $1 }
alphabetArray


/*:
 ### Enumerating an Array
 */
let array = ["Apple", "Orange", "Melon"]

for value in array {
  if let index = array.index(of: value) {
    print("\(index) - \(value)")
  }
}//optional이기 때문에 if 로 받은거

print("\n---------- [ reversed ] ----------\n")

for value in array.reversed() {
  if let index = array.index(of: value) {
    print("\(index) - \(value)")
  }
}

print("\n---------- [ enumerated ] ----------\n")

for tuple in array.enumerated() {
  print("#\(tuple.0) - \(tuple.1)")
//  print("#\(tuple.offset) - \(tuple.element)")
}

print("\n---------- [ enumerated ] ----------\n")

for (index, word) in array.enumerated() {
  print("#\(index) - \(word)")
}


//: [Next](@next)
