/*
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203



*/




- involves setting an initial value for each stored property on that instance and performing any other setup or initialization that is required before 
the new instance is ready for use.
- Unlike Objective-C initializers, Swift initializers do not return a value. Their primary role is to ensure that new instances of a type are correctly 
initialized before they are used for the first time.
- Instances of class types can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.

*/


/*  Setting Initial Values for Stored Properties  */
//In classes and structs, Stored properties cannot be left in an indeterminate state by the time an instance of that class or structure is created.
//You can set an initial value for a stored property within an initializer, or by assigning a default property value as part of the property’s 
definition.
//NOTE: When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set 
directly, without calling any property observers.

//1)  In its simplest form, an initializer is like an instance method with no parameters
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")  // Prints "The default temperature is 32.0° Fahrenheit"

//2)  Or giving default value to the stored property
//The end result is the same, but the default value ties the property’s initialization more closely to its declaration. It makes for shorter, clearer 
initializers and enables you to infer the type of the property from its default value. 
//The default value also makes it easier for you to take advantage of default initializers and initializer inheritance, as described later in this 
chapter.
struct Fahrenheit {
    var temperature = 32.0
}


/*  Customizing Initialization  */
//You can customize the initialization process with input parameters and optional property types, or by assigning constant properties during 
initialization, as described in the following sections.

/*Initialization Parameters*/
struct Celsius {
    var temperatureInCelsius: Double
    /*  two custom initializers */
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)  // boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)  // freezingPointOfWater.temperatureInCelsius is 0.0



/*  Parameter Names and Argument Labels  */
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

let veryGreen = Color(0.0, 1.0, 0.0)  // this reports a compile-time error - argument labels are required
//(Argument labels must always be used in an initializer if they are defined, and omitting them is a compile-time error:)



/*  Initializer Parameters Without Argument Labels  */
//If you do not want to use an argument label for an initializer parameter, write an underscore (_) instead of an explicit argument label for that 
parameter to override the default behavior.
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0) // bodyTemperature.temperatureInCelsius is 37.0

/*  Optional Property Types */
//Properties of optional type are automatically initialized with a value of nil, indicating that the property is deliberately intended to have “no value 
yet” during initialization.
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()  // Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."

/*  Assigning Constant Properties During Initialization    */
//IMPORTANT: You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time 
initialization finishes. Once a constant property is assigned a value, it can’t be further modified.
//IMPORTANT: For class instances, a constant property can be modified during initialization only by the class that introduces it. It cannot be modified 
by a subclass.
class SurveyQuestion {
    let text: String  //Even though the text property is now a constant, it can still be set within the class’s initializer:
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask() // Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"




/*  Deinitializers  */

//A deinitializer is called immediately before a class instance is deallocated.
//Deinitializers are only available on class types

//Swift automatically deallocates your instances when they are no longer needed, to free up resources.

//However, when you are working with your own resources, you might need to perform some additional cleanup yourself.
//For example, if you create a custom class to open a file and write some data to it, you might need to close the file before the class instance is 
deallocated.
//You are not allowed to call a deinitializer yourself.

/*  A good example where you would use deinit   */
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {//The deinitializer does not take any parameters and is written without parentheses:
        Bank.receive(coins: coinsInPurse)
    }
}

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins") // Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank") // Prints "There are now 9900 coins left in the bank"

playerOne!.win(coins: 2_000)    //Because playerOne is an optional, it is qualified with an exclamation mark (!)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins") // Prints "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left") // Prints "The bank now only has 7900 coins left"

playerOne = nil //The player has now left the game.
print("PlayerOne has left the game")    // Prints "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins") // Prints "The bank now has 10000 coins"

//Superclass deinitializers are inherited by their subclasses, and the superclass deinitializer is called automatically at the end of a subclass 
deinitializer implementation. 
//Superclass deinitializers are always called, even if a subclass does not provide its own deinitializer.

//Because an instance is not deallocated until after its deinitializer is called, a deinitializer can access all properties of the instance it is called 
on and can modify its behavior based on those properties 
//(such as looking up the name of a file that needs to be closed).


/*  Default Initializers    */
//The default initializer for any class or struct simply creates a new instance with all of its properties set to their default values.
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

//Memberwise Initializers for Structure Types
//The memberwise initializer is a shorthand way to initialize the member properties of new structure instances. Initial values for the properties of the 
new instance can be passed to the memberwise initializer by name.
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


/*  Initializer Delegation for Value Types  */
//Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
/*1*/let basicRect = Rect()  // basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)
/*2*/let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))  // originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)
/*3*/let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))  // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

//See how initializer delegation is used when centerRect is initialized using 3rd initializer


/*  Class Inheritance and Initialization    */
//Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value. These are known as designated 
initializers and convenience initializers.


/*  Designated Initializers and Convenience Initializers  */
//Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and 
//calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
//Designated initializers are “funnel” points through which initialization takes place, and through which the initialization process continues up the 
superclass chain.
//Every class must have at least one designated initializer. (In some cases, this requirement is satisfied by inheriting one or more designated 
initializers from a superclass)

//Convenience initializers are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer 
from the same class as the convenience initializer with some of the designated initializer’s parameters set to default values. 
//You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
//You do not have to provide convenience initializers if your class does not require them. Create convenience initializers whenever a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent.


//Designated Initializers
init(parameters) {
    statements
}

//Convenience Initializers
convenience init(parameters) {
    statements
}

/*
To simplify the relationships between designated and convenience initializers, Swift applies the following three rules for delegation calls between initializers:
Rule 1: A designated initializer must call a designated initializer from its immediate superclass.
Rule 2: A convenience initializer must call another initializer from the same class.
Rule 3: A convenience initializer must ultimately call a designated initializer.

A simple way to remember this is:
Designated initializers must always delegate up.
Convenience initializers must always delegate across.
(once see the figure: you'll understand very clearly)

Note: These rules don’t affect how users of your classes create instances of each class.
      Any initializer in the diagram above can be used to create a fully-initialized instance of the class they belong to.
      The rules only affect how you write the implementation of the class’s initializers.

That's why Designated initializers are like “funnel” points through which initialization takes place, and through which the initialization process 
continues up the superclass chain and
simplifying the interrelationships among classes in the chain. (see second diagram)
*/

/*  Two-Phase Initialization    */
/*  Class initialization in Swift is a two-phase process.
    In the first phase, each stored property is assigned an initial value by the class that introduced it.
    Once the initial state for every stored property has been determined, the second phase begins,
    and each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use

    Uses:
    - makes initialization safe, while still giving complete flexibility to each class in a class hierarchy.
    - prevents property values from being accessed before they are initialized, and prevents property values from being set to a different value by 
another initializer unexpectedly.

    Note: Swift’s two-phase initialization process is similar to initialization in Objective-C. 
          The main difference is that during phase 1, Objective-C assigns zero or null values (such as 0 or nil) to every property.
          Swift’s initialization flow is more flexible in that it lets you set custom initial values, and can cope with types for which 0 or nil is not 
a valid default value.

    Swift’s compiler performs four helpful safety-checks to make sure that two-phase initialization is completed without error:
    Safety check 1: A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a 
superclass initializer.
    Safety check 2: A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property. If it 
doesn’t, the new value the designated initializer assigns will be overwritten by the superclass as part of its own initialization.
    Safety check 3: A convenience initializer must delegate to another initializer before assigning a value to any property (including properties 
defined by the same class). If it doesn’t, the new value the convenience initializer assigns will be overwritten by its own class’s designated 
initializer.
    Safety check 4: An initializer cannot call any instance methods, read the values of any instance properties, or refer to self as a value until after 
the first phase of initialization is complete.
The class instance is not fully valid until the first phase ends. Properties can only be accessed, and methods can only be called, once the class 
instance is known to be valid at the end of the first phase.

Two-phase initialization in Play!
Phase 1
-------
- A designated or convenience initializer is called on a class.
- Memory for a new instance of that class is allocated. The memory is not yet initialized.
- A designated initializer for that class confirms that all stored properties introduced by that class have a value. The memory for these stored 
properties is now initialized.
- The designated initializer hands off to a superclass initializer to perform the same task for its own stored properties.
- This continues up the class inheritance chain until the top of the chain is reached.
- Once the top of the chain is reached, and the final class in the chain has ensured that all of its stored properties have a value, the instance’s 
memory is considered to be fully initialized, and phase 1 is complete.

Phase 2
--------
- Working back down from the top of the chain, each designated initializer in the chain has the option to customize the instance further. Initializers 
are now able to access self and can modify its properties, call its instance methods, and so on.
- Finally, any convenience initializers in the chain have the option to customize the instance and to work with self.
















