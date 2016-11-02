/*






*/





struct Resolution {
    var width = 0
    var height = 0
}


/*  Instantiation */
let someResolution = Resolution() 
let vga = Resolution(width: 640, height: 480) //All structures have an automatically-generated "memberwise initializer".

//Note: Unlike structures, class instances do not receive a default memberwise initializer.
  
/* Structs are Value-Types  */



/* Swift Collections: Arrays, Sets and Dictionaies: What are they: Classes or Structs? */
//In Swift, many basic data types such as String, Array, and Dictionary are implemented as structures. This means that data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.
//This behavior is different from Foundation: NSString, NSArray, and NSDictionary are implemented as classes, not structures. Strings, arrays, and dictionaries in Foundation are always assigned and passed around as a reference to an existing instance, rather than as a copy.
// The behavior you see in your code will always be as if a copy took place. However, Swift only performs an actual copy behind the scenes when it is absolutely necessary to do so. Swift manages all value copying to ensure optimal performance, and you should not avoid assignment to try to preempt this optimization.
