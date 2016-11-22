/*    
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267

A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task
Protocol == Interface (Adopting a protocol == Implementing an Interface)



*/


/*  Protocol Syntax */
//You define protocols in a very similar way to classes, structures, and enumerations:
protocol SomeProtocol {
    // protocol definition goes here
}

//and Types which conform to a protocol's syntax would be like this:
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}
//If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}


//A protocol can require any conforming type to provide an instance property(can be stored or computed) or type property with a particular name and type.
//The protocol also specifies whether each property must be (gettable) or (gettable and settable).

protocol SomeProtocol {
//instance property requirements are always declared as variable properties, prefixed with the var keyword.
    var mustBeSettable: Int { get set }   //(gettable and settable) property
    var doesNotNeedToBeSettable: Int { get }  //(gettable) property

//Always prefix type property requirements with the static keyword when you define them in a protocol
    static var someTypeProperty: Int { get set }
//when you implement it in the conforming class, you are free to use 'static' or 'class'
}

/*  Method Requirements */
//Protocols can require specific instance methods and type methods to be implemented by conforming types. 
//Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, cannot be specified for method parameters within a protocol’s definition.
protocol SomeProtocol {
    static func someTypeMethod()  //type method
    func random() -> Double //instance method
}

/*  Mutating Method Requirements  */
//It is sometimes necessary for a method to modify (or mutate) the instance it belongs to.
//The mutating keyword is only used by structures and enumerations. (i.e value types only)
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()  // lightSwitch is now equal to .on

/*  Initializer Requirements  */
//Protocols can "require" specific initializers to be "implemented" by "conforming types".
protocol SomeProtocol {
    init(someParameter: Int)  //note that there's no body given
}
/*  Class Implementations of Protocol Initializer Requirements  */
//You can implement a protocol initializer requirement on a conforming class as either a designated initializer or a convenience initializer.
//In either case, you must mark the initializer implementation with the required modifier
class SomeClass: SomeProtocol {
    required init(someParameter: Int) { //prefixing with 'required' keyword is compulsory for init methods (except for final classes)
        // initializer implementation goes here
    }
}
//The use of the required modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.
//NOTE: You do not need to mark protocol initializer implementations with the required modifier on classes that are marked with the final modifier, because final classes cannot be subclassed. 

//If a subclass overrides a designated initializer from a superclass, and also implements a matching initializer requirement from a protocol, mark the initializer implementation with both the required and override modifiers:
protocol SomeProtocol {
    init()
}
class SomeSuperClass {
    init() {
        // initializer implementation goes here
    }
}
class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}

/*  Failable Initializer Requirements */
//Protocols can define failable initializer requirements for conforming types, as defined in Failable Initializers.
//A failable initializer requirement can be satisfied by a failable or nonfailable initializer on a conforming type. A nonfailable initializer requirement can be satisfied by a nonfailable initializer or an implicitly unwrapped failable initializer.


/*  Protocols as Types  */
// /*Protocols do not actually implement any functionality themselves. Nonetheless, any protocol you create will become a fully-fledged type for use in your code.
- As a parameter type or return type in a function, method, or initializer
- As the type of a constant, variable, or property
- As the type of items in an array, dictionary, or other container
Because protocols are types, begin their names with a capital letter (such as FullyNamed and RandomNumberGenerator) to match the names of other types in Swift (such as Int, String, and Double).
*/

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
//The generator property is of type RandomNumberGenerator. Therefore, you can set it to an instance of any type that adopts the RandomNumberGenerator protocol. 
//Nothing else is required of the instance you assign to this property, except that the instance must adopt the RandomNumberGenerator protocol.(like LinearCongruentialGenerator defined below)
//also see there's an argument in init which conforms to RandomNumberGenerator Protocol

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4
// Random dice roll is 5
// Random dice roll is 4


/*  Protocol Inheritance  */
//A protocol can inherit one or more other protocols and can add further requirements on top of the requirements it inherits.
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

//This example defines a new protocol, PrettyTextRepresentable protocol, which inherits from TextRepresentable.
//Anything that adopts PrettyTextRepresentable must satisfy all of the requirements enforced by TextRepresentable, plus the additional requirements enforced by PrettyTextRepresentable. 

//The SnakesAndLadders class can be extended to adopt and conform to PrettyTextRepresentable:
extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}
//Note that anything that is PrettyTextRepresentable must also be TextRepresentable, and so the implementation of prettyTextualDescription starts by accessing the textualDescription property from the TextRepresentable protocol to begin an output string. 



