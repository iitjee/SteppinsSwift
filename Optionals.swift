/*  






*/


/*  Optional Chaining as an alternative to Forced Unwrapping  */

linkedListNode!.next()  //here, if linkedListNode is nil, forced unwrapping triggers a runtime error
linkedListNode?.next()  //here, if linkedListNode is nil, optional chaining fails gracefully and next() is simply not called

//NOTE: To reflect the fact that optional chaining can be called on a nil value, the result of an optional chaining call is always an optional value, **even if the property, method, or subscript you are querying returns a nonoptional value**.
//eg: A property that normally returns an Int will now return an Int? when accessed through optional chaining.  (i.e Int is now wrapped in an optional)




class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}

let john = Person()

//Forced Unwrapping
let roomCount = john.residence!.numberOfRooms // this triggers a runtime error since residence is always nil

//Optional Chaining along with optional binding
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
} // Prints "Unable to retrieve the number of rooms."

//Note again: The fact that numberOfRooms is queried through an optional chain means that the call to numberOfRooms will always return an Int? instead of an Int.

john.residence = Residence()  //john.residence now contains an actual Residence instance, rather than nil.
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
} // Prints "John's residence has 1 room(s)."






















