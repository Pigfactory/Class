//: Playground - noun: a place where people can play

import UIKit


//=====================================================
//Q1
//=====================================================




















//=====================================================
//Q2
//=====================================================

class Square {
    var area: Float = 0
    var perimeter: Float = 0
    var length: Float = 0
    
    func squareArea1(s: Float) -> Float {
        area = s * s
        print (area)
        return area
    }
    
    func squareArea2() {
        area = length * length
        print (area)
    }
}

let a1 = Square()
a1.length = 3
a1.squareArea1(s: 4)
a1.length
a1.squareArea2()


class Sphere {
    var volume: Double = 0
    var radius: Double = 0
    let π: Double = Double.pi
    
    func SphereVolume(r: Double) -> Double {
        volume = 4 / 3 * r * r * r * π
        print (volume)
        return volume
    }
}

let b1 = Sphere()
b1.π
b1.SphereVolume(r: 4)



//=====================================================
//Q3
//=====================================================

class Animal {
    let brain: Bool = true
    var leg: Int = 0
}

let a = Animal()
a.leg
a.brain


class Human: Animal {
    override var leg: Int {
        get {
            return super.leg + 2
        }
        set {
            super.leg
        }
    }
}

let b = Human()
b.leg
b.brain


class Pet: Animal {
    var fleas: Int = 0
    override var leg: Int {
        get {
            return super.leg + 4
        }
        set {
            super.leg
        }
    }
}

let c = Pet()
c.leg
c.brain
c.fleas


class Dog: Pet {
    override var fleas: Int {
        get {
            return super.fleas + 8
        }
        set {
            super.fleas
        }
    }
}

let d = Dog()
d.leg
d.brain
d.fleas


class Cat: Pet {
    override var fleas: Int {
        get {
            return super.fleas + 4
        }
        set {
            super.fleas
        }
    }
}

let e = Cat()
e.leg
e.brain
e.fleas


//=====================================================
//Q4
//=====================================================

class DogTwo {
    func bark() {
        print("WOW WOW")
    }
}

let f = DogTwo()
f.bark()

class Poodle: DogTwo {
    override func bark() {
        print("POO POO")
    }
}

let g = Poodle()
g.bark()


class Husky: DogTwo {
    override func bark() {
        print("HUSK HUSK")
    }
}

let h = Husky()
h.bark()

class Bulldog: DogTwo {
    override func bark() {
        print("BULL BULL")
    }
}

let i = Bulldog()
i.bark()





