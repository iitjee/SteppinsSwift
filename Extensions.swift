/*
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html

Extensions add new functionality to an existing class, structure, enumeration, or protocol type. 
This includes the ability to extend types for which you do not have access to the original source code (known as retroactive modeling). 

Extensions are similar to categories in Objective-C. (except that they don't have names)
In Swift, you can even extend a protocol to provide implementations of its requirements or add additional functionality that conforming types can take advantage of.

NOTE: Extensions can add new functionality to a type, but they cannot override existing functionality.
NOTE: If you define an extension to add new functionality to an existing type, the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.
NOTE: Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties.

NOTE: You can't add new cases to an enum using extension.
NOTE: If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.

*/

extension String {
var length: String {
}

extension Double { //all below are read-only computed properties
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm //0.0254
let oneMeter = 1.0  //1.0
let threeFeet = 3.ft //0.91439
//NOTE: Extensions can add new computed properties, but they cannot add stored properties, or add property observers to existing properties.

extension Int {
  func times(task: ()->() ) {
    for i in 0..<self {
      task()
    }
  }
}
3.times {print("Hello")} //very rx programming like

/*  Extensions can add new initializers to existing types.  */
//NOTE: Extensions can add new convenience initializers to a class, but they cannot add new designated initializers or deinitializers to a class.
//Designated initializers and deinitializers must always be provided by the original class implementation.


extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
//NOTE: If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.



/*Extensions can add new instance methods and type methods to existing types*/
extension Int {
  func times(task: ()->() ) {
    for _ in 0..<self {
      task()
    }
  }
}
3.times {print("Hello")} //very rx programming like

/*  Instance methods added with an extension can also modify (or mutate) the instance itself. */
// Structure and enumeration methods that modify self or its properties must mark the instance method as mutating, just like mutating methods from an original implementation.
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
// someInt is now 9


/* Extensions can add new subscripts to an existing type.  */
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
//This subscript [n] returns the decimal digit n places in from the right of the number
746381295[0]  // returns 5
746381295[1]  // returns 9
746381295[2]  // returns 2
746381295[8]  // returns 7
746381295[9]  // returns 0, as if you had requested: 0746381295[9]


/*  Extensions can add new nested types to existing classes, structures, and enumerations */
//This example adds a new nested enumeration to Int. This enumeration, called Kind, expresses the kind of number that a particular integer represents. Specifically, it expresses whether the number is negative, zero, or positive.
//This example also adds a new computed instance property to Int, called kind, which returns the appropriate Kind enumeration case for that integer.
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

//The nested enumeration can now be used with any Int value:
func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])  // Prints "+ + - 0 - 0 + "

//NOTE: number.kind is already known to be of type Int.Kind. Because of this, all of the Int.Kind case values can be written in shorthand form inside the switch statement, such as .negative rather than Int.Kind.negative.










