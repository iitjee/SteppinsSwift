/*    
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267

A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task
Protocol == Interface (Adopting a protocol == Implementing an Interface)

Protocols(Interfaces) are at the center of almost any programming language. They are better than inheritance due to a problem
called "Fragile Base Class"




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
    var doesNotNeedToBeSettable: Int { get }  //(gettable) property(=> read-only) (also, for read-only, you can omit 'get')

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

/*  Mutating Method Requirements(ONY FOR STRUCTS AND ENUMS)  */
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
    required override init() {  //here since 'required' keyword is used, it's protocol's init() method
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




//A protocol can be used as the type to be stored in a collection such as an array or a dictionary,
let things: [TextRepresentable] = [game, d12, simonTheHamster]  //TextRepresentable is the protocol
for thing in things {
    print(thing.textualDescription)
}
// A game of Snakes and Ladders with 25 squares
// A 12-sided dice
// A hamster named Simon






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

/*  Class-Only Protocols    */
//You can limit protocol adoption to class types (and not structures or enumerations) by adding the class keyword to a protocol’s inheritance list.
//VERY IMP:Use a class-only protocol when the behavior defined by that protocol’s requirements assumes or requires that a conforming type has reference semantics rather than value semantics.
protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
    // class-only protocol definition goes here
}
// It is a compile-time error to write a structure or enumeration definition that tries to adopt SomeClassOnlyProtocol.



/* Protocol Composition */
//You can combine multiple protocols into a single requirement with a protocol composition for eg; SomeProtocol & AnotherProtocol
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}
let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)   // Prints "Happy birthday, Malcolm, you're 21!"
//The type of the celebrator parameter is Named & Aged, which means “any type that conforms to both the Named and Aged protocols.” It doesn’t matter what specific type is passed to the function, as long as it conforms to both of the required protocols.
//Protocol compositions do not define a new, permanent protocol type. Rather, they define a temporary local protocol that has the combined requirements of all protocols in the composition.

/*  Checking for Protocol Conformance   */
You can use the is and as operators described in Type Casting to check for protocol conformance, and to cast to a specific protocol.
- The is operator returns true if an instance conforms to a protocol and returns false if it does not.
- The as? version of the downcast operator returns an optional value of the protocol’s type, and this value is nil if the instance does not conform to that protocol.
- The as! version of the downcast operator forces the downcast to the protocol type and triggers a runtime error if the downcast does not succeed.
*/

protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}
//The Circle class implements the area property requirement as a computed property, based on a stored radius property. The Country class implements the area requirement directly as a stored property. Both classes correctly conform to the HasArea protocol.
class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
//The Circle, Country and Animal classes do not have a shared base class. Nonetheless, they are all classes, and so instances of all three types can be used to initialize an array that stores values of type AnyObject:
//The objects array can now be iterated, and each object in the array can be checked to see if it conforms to the HasArea protocol:
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}
// Area is 12.5663708
// Area is 243610.0
// Something that doesn't have an area

//IMP NOTE: Note that the underlying objects are not changed by the casting process. They continue to be a Circle, a Country and an Animal. However, at the point that they are stored in the objectWithArea constant, they are only known to be of type HasArea, and so only their area property can be accessed.



/*  Optional Protocol Requirements  */
//Optional requirements are available so that you can write code that interoperates with Objective-C.
// Both the protocol and the optional requirement must be marked with the @objc attribute.
// Note that @objc protocols can be adopted only by classes that inherit from Objective-C classes or other @objc classes.
// They can’t be adopted by structures or enumerations.

//Note: When you use a method or property in an optional requirement, its type automatically becomes an optional. For example, a method of type (Int) -> String becomes ((Int) -> String)?. Note that the entire function type is wrapped in the optional, not the method’s return value.

//An optional protocol requirement can be called with optional chaining, to account for the possibility that the requirement was not implemented by a type that conforms to the protocol using this syntax: someOptionalMethod?(someArgument) 
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}
//The CounterDataSource protocol defines an optional method requirement called increment(forCount:) and an optional property requirement called fixedIncrement.
//These requirements define two different ways for data sources to provide an appropriate increment amount for a Counter instance.

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
    //The increment() method first tries to retrieve an increment amount by looking for an implementation of the increment(forCount:) method on its data source. The increment() method uses optional chaining to try to call increment(forCount:), and passes the current count value as the method’s single argument.
}

//IMPORTANT: Note that two levels of optional chaining are at play here. First, it is possible that dataSource may be nil, and so dataSource has a question mark after its name to indicate that increment(forCount:) should be called only if dataSource isn’t nil. 
//           Second, even if dataSource does exist, there is no guarantee that it implements increment(forCount:), because it is an optional requirement. Here, the possibility that increment(forCount:) might not be implemented is also handled by optional chaining. 
//           The call to increment(forCount:) happens only if increment(forCount:) exists—that is, if it isn’t nil. This is why increment(forCount:) is also written with a question mark after its name.

//Because the call to increment(forCount:) can fail for either of these two reasons, the call returns an optional Int value. This is true even though increment(forCount:) is defined as returning a nonoptional Int value in the definition of CounterDataSource.

//After calling increment(forCount:), the optional Int that it returns is unwrapped into a constant called amount, using optional binding. If the optional Int does contain a value—that is, if the delegate and method both exist, and the method returned a value—the unwrapped amount is added onto the stored count property, and incrementation is complete.

//If it is not possible to retrieve a value from the increment(forCount:) method—either because dataSource is nil, or because the data source does not implement increment(forCount:)—then the increment() method tries to retrieve a value from the data source’s fixedIncrement property instead. The fixedIncrement property is also an optional requirement, so its value is an optional Int value, even though fixedIncrement is defined as a nonoptional Int property as part of the CounterDataSource protocol definition.

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}   //Here’s a simple CounterDataSource implementation where the data source returns a constant value of 3 every time it is queried. It does this by implementing the optional fixedIncrement property requirement

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}
// 3
// 6
// 9
// 12


//Here’s a more complex data source called TowardsZeroSource, which makes a Counter instance count up or down towards zero from its current count value:

to be contd..






