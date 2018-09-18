//: [Previous](@previous)

/***************************************************
 1. width, height 속성을 가진 Quadrangle 클래스 정의
 2. 초기화 메서드에서 width, height 프로퍼티 값을 설정할 수 있도록 구현
 3. 사각형의 가로 세로 길이를 설정할 수 있는 메서드 구현
 4. 사각형의 가로세로 길이  /  사각형의 넓이를 반환하는 메서드를 각각 구현
 5. 다음과 같은 속성을 지닌 인스턴스 생성
 
 - 직사각형 1개 속성: width = 10, height = 5
 - 정사각형 1개 속성: width = 7, height = 7
 ***************************************************/

class Quadrangle {
    var width: Int
    var height: Int
    
//    init(){
//    }
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

//    func set(Width: Int, Height: Int) {
//        width = Width
//        height = Height
//    }

    func area()-> Int {
        print ("area:", width * height)
        return width * height
    }
    func length() -> (Int, Int) {
        print("width: \(width), height: \(height)")
        return (width, height)
    }
}
//var sampleeee = Quadrangle()  //이거는 왜 안되나??? init 를 받게 되는순간 쓸수가없음, 하고싶으면 init() {} 를 추가로 넣어주어야됨
let sample = Quadrangle.init(width: 5, height: 10)
//sample.set(Width: 10, Height: 5)
sample.area()
sample.length()

//==================================================

class Quadrangle2 {
    var width = 0
    var height = 0
    var areaSize: Int {
        get {
            return width * height
        }
        set {
            width = newValue
            height = newValue
        }
    }
}

let sample2 = Quadrangle2()
sample2.height = 10
sample2.width = 50
sample2.areaSize
//set의 역할은?



/***************************************************
 1. 채널 정보, Volume 값, 전원 설정여부를 속성으로 가지는 클래스 정의
 2. TV 의 현재 채널 및 볼륨을 확인할 수 있는 메서드 및 변경 가능한 메서드 구현
 3. TV 전원이 꺼져있을 때는 채널과 볼륨 변경을 할 수 없도록 구현
 4. TV 전원이 꺼져있을 때는 채널과 볼륨 정보를 확인했을 때 -1 이 반환되도록 구현
 ***************************************************/

class TV {
    var channelInfo: String = "MBC"
    var volume: Int = 5
    var power: Bool = true
    
    func info() -> (String, Int, Bool) {
        if power == false {
            print("your TV is turned off")
            return("xx", -1, false)
        } else {
            print ("Channel: \(channelInfo), Volume: \(volume), Power: \(power)")
            return (channelInfo, volume, power)
        }
    }
    
    func change(ch: String, vol: Int, ON: Bool) -> (String, Int, Bool){
        if ON == false {
            self.power = ON
            print("you need to turn on the TV")
            return (channelInfo, volume, power)
        } else {
            self.channelInfo = ch
            self.volume = vol
            self.power = ON
            print ("Channel: \(channelInfo), Volume: \(volume), Power: \(power)")
            return (channelInfo, volume, power)
        }
    }
}

let myTv = TV()
myTv.info()
myTv.change(ch: "BBC", vol: 7, ON: true)
myTv.change(ch: "KBS", vol: 1, ON: false)
myTv.info()
myTv.change(ch: "TTT", vol: 2, ON: true)

/***************************************************
 1. 사각형의 길이를 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 2. 원의 반지름을 설정하는 초기화 메서드, 둘레와 넓이값을 구하는 메서드 구현
 ***************************************************/

class Square {
    var width = 0
    var height = 0
    init(Height: Int, Width: Int){
        self.width = Width
        self.height = Height
    }
    func SqaureLength() {
        print ("Length:", width * 2 + height * 2)
    }
    func SqaureArea() {
        print ("Area:", width * height)
    }
}

let sampleSquare = Square.init(Height: 5, Width: 4)
sampleSquare.SqaureArea()
sampleSquare.SqaureLength()


class Circle {
    var radius:Double = 0
    init(Radius: Double){
        self.radius = Radius
    }
    func CircleLength() {
        print("Length:", 2 * radius * 3.14)
    }
    func CircleArea() {
        print("Area:", radius * radius * 3.14)
    }
}
let sampleCircle = Circle.init(Radius: 8)
sampleCircle.CircleArea()
sampleCircle.CircleLength()


//: [Next](@next)
