//: Playground - noun: a place where people can play

import UIKit

//=====================================================
//Q1
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
//Q2
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

