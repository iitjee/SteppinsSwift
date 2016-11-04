/*

*/




//The values defined in an enumeration (such as north, south, east, and west) are its enumeration cases.
//You use the case keyword to introduce new enumeration cases.
enum CompassPoint {
    case north
    case south
    case east, west //declaring multiple cases statements in one statement
}

var directionToHead = CompassPoint.west
directionToHead = .east //The type of directionToHead is already known, and so you can drop the type when setting its value.

/*  Use in switch-case Statement  */
switch directionToHead {  
case .north:  //no need of CompassPoint.north
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
} // Prints "Watch out for penguins"

//Note: As described in Control Flow, a switch statement must be exhaustive when considering an enumeration’s cases. If the case for .west is omitted, this code does not compile, because it does not consider the complete list of CompassPoint cases.
//Requiring exhaustiveness ensures that enumeration cases are not accidentally omitted. (When it is not appropriate to provide a case for every enumeration case, you can provide a default case to cover any cases that are not addressed explicitly)



