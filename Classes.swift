/*



*/



/* Class Initialization */
class VideoMode {
    var resolution = Resolution() 
    var interlaced = false  //default value of false
    var frameRate = 0.0     //default value of 0.0
    var name: String?       //default value of nil
    var company: String     //default value given in initializer ("Canon")
    
 
    
    
    /*  Initialization  */
    init() {
    company = "Canon"   
    }
    
    init(comp: String) {
    company = comp
    }
    
    /*  Deinitalization */
    deinit {
    
    }
    
    /*  Normal Function   */
    func normalFunction() {
    
    }
    
    /*  Final Function  */
    final func printName(name: String) {   //final => Subclass can't override it
    print("Video company name is \(name)")
    }
    
       /* Static Variables */
    static var numberOfVideos = 0;  //same variable reference for all the class objects. (changing this in one object will reflect in all other objects as well.)
    
    /*  Static Functions */
    
    
    /*Lazy Variable */
    lazy var companyInfo = Company()    //Here company is some class.  the Company instance for the companyInfo property is only created when the companyInfo property is first accessed.
    
    
}

/*  Instantiation:  Classes and Structs MUST set all of their stored properties to an appropriate initial value by the time an instance of that class or Struct is created. */
let someVideoMode = VideoMode()
//interlaced, frameRate has default values whereas company is given value with "initializer"


/* Classes are reference types  */
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
//This example declares a new constant called tenEighty and sets it to refer to a new instance of the VideoMode class. 
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//Because classes are reference types, tenEighty and alsoTenEighty actually both refer to the same VideoMode instance. so tenEightly.frameRate is also 30.0 now.

//V.IMP NOTE: Note that tenEighty and alsoTenEighty are declared as constants, rather than variables. 
//However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate because the values of the tenEighty 
// and alsoTenEighty constants themselves do not actually change. 
// tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes.
// It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.

/* Identity Operators(=== and !==) */
//Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same is not true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

//Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):
//“Identical to” means that two constants or variables of class type refer to exactly the same class instance.
//“Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.(one can define one's own implementations of the “equal to” and “not equal to” operators using Equivalence Operators.


/* Swift Collections */
//In Swift, many basic data types such as String, Array, and Dictionary are implemented as structures. This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.
//This behavior is different from Foundation: NSString, NSArray, and NSDictionary are implemented as classes, not structures. Strings, arrays, and dictionaries in Foundation are always assigned and passed around as a reference to an existing instance, rather than as a copy.
// The behavior you see in your code will always be as if a copy took place. However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. Swift manages all value copying to ensure optimal performance, and you should not avoid assignment to try to preempt this optimization.



/* Lazy Variable */
//A lazy stored property is a property whose initial value is not calculated until the first time it is used. 
//You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore cannot be declared as lazy.
//Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete. Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is needed.

//If a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property has not yet been initialized, there is no guarantee that the property will be initialized only once.


/*  Static Methods  */
//Static methods cannot be overridden by subclasses. => acting like 'final'
//Static methods are lazy by default.

/* Deinitializtion  */
//Unlike in langs like Java or C# where unused variables are cleared at some "random point of time" (Called Garbage Collection) in Swift, you exactly know when the variable is being cleared. (Called Reference Counting)







